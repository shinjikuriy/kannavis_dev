# == Schema Information
#
# Table name: mifune_kanjidict
#
#  id                 :bigint           not null, primary key
#  grapheme           :string(1)        not null
#  radical            :string(1)
#  radical_variant    :string(1)
#  phonetic_component :string(1)
#  idc                :string
#  classification     :string
#  joyo_onyomis       :string           is an Array
#  joyo_kunyomis      :string           is an Array
#  onyomis            :string           is an Array
#  kunyomis           :string           is an Array
#  nanoris            :string           is an Array
#  stroke_count       :integer          not null
#  grade              :string
#  jlpt               :string
#  kanken             :string
#  frequency          :integer
#  meanings           :string           is an Array
#  compact_meanings   :string           is an Array
#  rtk1_3_old         :integer
#  rtk1_3_new         :integer
#  ko2001             :integer
#  ko2301             :integer
#  wrp_jkf            :integer
#  wanikani           :integer
#
class MifuneKanjidict < ProgramDataRecord
  self.table_name = "mifune_kanjidict"
end
