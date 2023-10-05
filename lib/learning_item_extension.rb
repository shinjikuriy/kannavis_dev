module LearningItemExtension
  def acquired_kanjis
    acquired_items = where('status = ?', LearningItem.statuses[:acquired]).order(:id)
    return [] if acquired_items.empty?

    acquired_items.map do |item|
      Kanji.find(item.kanji_id)
    end
  end

  def possibly_acquired_kanjis
    possibly_acquired_items = where(status: LearningItem.statuses[:possibly_acquired])
    return [] if possibly_acquired_items.empty?

    Kanji.where(id: possibly_acquired_items.map(&:kanji_id)).order(:id)
  end

  def presume_acquired_kanjis
    acquired_kanji_ids = where('status = ?', LearningItem.statuses[:acquired]).order(:id).map(&:kanji_id)
    lowest_ranking = Kanji.where(id: acquired_kanji_ids).map(&:ranking).max
    Kanji.where('ranking < ?', lowest_ranking).order(:id).each do |kanji|
      unless map(&:kanji_id).include?(kanji.id)
        create(kanji_id: kanji.id, status: :possibly_acquired) unless acquired_kanji_ids.include?(kanji.id)
        next
      end

      status = LearningItem.find_by(kanji_id: kanji.id).status
      if status == 'possibly_planned'
        LearningItem.find_by(kanji_id: kanji.id).status = :possibly_acquired
      else
        next
      end
    end
    possibly_acquired_kanjis
  end
end
