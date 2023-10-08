module LearningItemExtension
  # statusで絞り込んだlearning_itemsを得る
  # userがstatusごとのkanjisを得るためのメソッド
  def by_status(status)
    raise ArgumentError, "invalid argment: #{status}" unless LearningItem.statuses.include?(status)

    where(status: LearningItem.statuses[status]).order(:kanji_id)
  end
end
