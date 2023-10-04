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
  pending "add some examples to (or delete) #{__FILE__}"
end
