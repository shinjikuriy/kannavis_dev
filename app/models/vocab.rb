# == Schema Information
#
# Table name: vocabs
#
#  id                  :bigint           primary key
#  defacto_orthography :string
#  lexeme              :string
#  standard_reading    :string
#  part_of_speech      :string
#  word_origin_type    :string
#  former_jlpt_level   :integer
#  level               :integer
#  ranking             :integer
#
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
