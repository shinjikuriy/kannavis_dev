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
require 'rails_helper'

RSpec.describe Vocab, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
