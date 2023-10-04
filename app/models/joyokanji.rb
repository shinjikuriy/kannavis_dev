# == Schema Information
#
# Table name: joyokanji
#
#  id            :bigint           not null, primary key
#  grapheme_orth :string(1)        not null
#  grapheme_alt  :string(1)
#  grapheme_olds :string           is an Array
#  radicals      :string           is an Array
#  stroke_count  :integer
#  grade         :string
#  added_year    :integer
#  removed_year  :integer
#  onyomis       :string           is an Array
#  kunyomis      :string           is an Array
#
class Joyokanji < ProgramDataRecord
  self.table_name = 'joyokanji'

  def readonly?
    true
  end
end
