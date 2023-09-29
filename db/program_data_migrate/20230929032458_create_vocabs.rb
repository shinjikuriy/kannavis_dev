class CreateVocabs < ActiveRecord::Migration[7.0]
  def change
    create_view :vocabs, materialized: true
  end
end
