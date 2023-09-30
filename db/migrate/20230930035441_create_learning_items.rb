class CreateLearningItems < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_items do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.bigint :kanji_id, null: false, index: true
      t.integer :status

      t.timestamps
      t.index [:user_id, :kanji_id], unique: true
      t.index [:kanji_id, :user_id]
    end
  end
end
