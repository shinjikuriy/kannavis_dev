# == Schema Information
#
# Table name: learning_items
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  kanji_id   :bigint           not null
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class LearningItem < ApplicationRecord
  belongs_to :user
  belongs_to :kanji, foreign_key: :kanji_id

  enum status: { acquired: 1, possibly_acquired: 2, possibly_planned: 3, planned: 4 }
end
