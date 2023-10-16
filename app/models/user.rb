# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  username               :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :trackable, :lockable, :timeoutable

  has_many :learning_items, -> { extending LearningItemExtension }, dependent: :destroy
  has_many :kanjis, through: :learning_items, disable_joins: true

  validates :username, presence: true, length: { minimum: 3 }, format: { with: /\A[a-zA-Z0-9_]+\z/ }, uniqueness: true

  # 現状、:acquiredなkanjiよりrankingが高いものはすべて習得済みと見なすこととする
  def presume_acquired_kanjis
    acquired_kanji_ids = learning_items.where(status: :acquired).map(&:kanji_id)
    lowest_ranking = Kanji.where(id: acquired_kanji_ids).map(&:ranking).max # SQLにしたほうがいい

    LearningItem.transaction do
      Kanji.where('ranking < ?', lowest_ranking).each do |kanji|
        unless kanji_ids.include?(kanji.id)
          learning_items.create!(kanji_id: kanji.id, status: :possibly_acquired) # 複数行INSERTにしたほうがいい
          next
        end

        item = learning_items.detect { |k| k.kanji_id == kanji.id }
        item.status = :possibly_acquired if item.possibly_planned?
      end
    end

    learning_items.where(status: :possibly_acquired).order(:kanji_id)
  end

  def presume_planned_kanjis
    # 習得済み漢字を得る
    reload
    acquired_kanji_ids = learning_items.where(status: :acquired).map(&:kanji_id)
    return [] if acquired_kanji_ids.blank?

    # 習得済み漢字が含まれる語彙を得る
    vocabs_with_acquired_kanjis = []
    Kanji.find(acquired_kanji_ids).each do |kanji|
      vocabs_with_acquired_kanjis.concat(kanji.vocabs.order(:ranking).take(3))
    end

    # 語彙から漢字を得る
    kanji_ids_in_vocabs = []
    vocabs_with_acquired_kanjis.each do |vocab|
      kanji_ids_in_vocabs.concat vocab.kanji_ids
    end
    kanji_ids_in_vocabs.uniq!&.sort!

    # 漢字のうち、learning_itemsに含まれないものをpossibly_plannedとしてlearning_itemsに追加する
    LearningItem.transaction do
      learning_items.where(status: :possibly_planned).each do |item|
        item.destroy unless kanji_ids_in_vocabs.include?(item.kanji_id)
      end

      (kanji_ids_in_vocabs - kanji_ids).each do |kanji_id|
        learning_items.create!(kanji_id: kanji_id, status: :possibly_planned)
      end
    end
  end
end
