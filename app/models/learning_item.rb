class LearningItem < ApplicationRecord
  belongs_to :user
  belongs_to :kanji, foreign_key: :kanji_id

  enum status: { acquired: 1, possibly_acquired: 2, possibly_planned: 3, planned: 4 }
end
