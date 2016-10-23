class CreateSeinfelds < ActiveRecord::Migration
  def change
    create_table :seinfelds do |t|
      t.string :title
      t.integer :season
      t.integer :episode
      t.text :description
      t.integer :rank

      t.timestamps null: false
    end
  end
end
