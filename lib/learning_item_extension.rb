module LearningItemExtension
  # statusで絞り込んだlearning_itemsを得る
  # userがstatusごとのkanjisを得るためのメソッド
  def by_status(status)
    raise ArgumentError, "invalid argment: #{status.inspect}" unless LearningItem.statuses.include?(status)

    where(status: LearningItem.statuses[status]).order(:kanji_id)
  end

  def create_or_update!(kanji_id:, status:)
    raise ArgumentError, "the argument for status is invalid: #{status.inspect}" unless LearningItem.statuses.include?(status)

    find_by(kanji_id: kanji_id)&.update(status: status) || create!(kanji_id: kanji_id, status: status)
  end
end
