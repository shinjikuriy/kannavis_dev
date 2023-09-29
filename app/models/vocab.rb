class Vocab < ProgramDataRecord
  has_and_belongs_to_many :kanjis
  self.primary_key = :id

  def self.refresh
    Scenic.database.refresh_materialized_view(table_name, concurrently: false, cascade: false)
  end

  def to_param
    defacto_orthography
  end
end
