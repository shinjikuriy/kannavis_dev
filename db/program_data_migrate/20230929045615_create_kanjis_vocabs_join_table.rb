class CreateKanjisVocabsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :kanjis, :vocabs do |t|
      t.index [:kanji_id, :vocab_id], unique: true
      t.index [:vocab_id, :kanji_id]
    end
  end
end
