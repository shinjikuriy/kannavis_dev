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
require 'rails_helper'

RSpec.describe LearningItem, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  describe 'LearningItem#create_or_update' do
    context '不正な引数が渡されたとき' do
      it '存在しないuser_idを渡すと例外が起こる' do
        expect do
          LearningItem.create_or_update!(user_id: 999_999_999, kanji_id: 1, status: :acquired)
        end.to raise_error(ActiveRecord::RecordInvalid)
      end
      it '存在しないkanji_idを渡すと例外が起こる' do
        expect do
          LearningItem.create_or_update!(user_id: user.id, kanji_id: 999_999_999, status: :acquired)
        end.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
