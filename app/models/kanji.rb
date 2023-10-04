# == Schema Information
#
# Table name: kanjis
#
#  id                   :bigint           primary key
#  grapheme             :string
#  grapheme_alt         :string(1)
#  grapheme_olds        :string           is an Array
#  onyomis              :string           is an Array
#  kunyomis             :string           is an Array
#  joyo_onyomis         :string           is an Array
#  joyo_kunyomis        :string           is an Array
#  compact_meanings     :string           is an Array
#  meanings             :string           is an Array
#  radical              :string(1)
#  radical_variant      :string(1)
#  phonetic_component   :string(1)
#  stroke_count         :integer
#  estimated_jlpt_level :string
#  former_jlpt_level    :string
#  level                :integer
#  ranking              :integer
#
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
