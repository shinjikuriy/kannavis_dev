class Vocab < ProgramDataRecord
  self.primary_key = :id

  def self.refresh
    Scenic.database.refresh_materialized_view(table_name, concurrently: false, cascade: false)
  end

  # def to_param
  #   standard_newspaper_orthography
  # end
end
