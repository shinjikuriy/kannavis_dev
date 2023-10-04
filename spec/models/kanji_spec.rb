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
require 'rails_helper'

RSpec.describe Kanji, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
