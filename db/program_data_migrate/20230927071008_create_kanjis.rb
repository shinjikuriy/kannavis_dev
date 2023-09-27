class CreateKanjis < ActiveRecord::Migration[7.0]
  def change
    create_view :kanjis, materialized: true
  end
end
