class Kanji < ProgramDataRecord
  has_and_belongs_to_many :vocabs
  self.primary_key = :id

  def self.refresh
    Scenic.database.refresh_materialized_view(table_name, concurrently: false, cascade: false)
  end

  def to_param
    grapheme
  end
end
