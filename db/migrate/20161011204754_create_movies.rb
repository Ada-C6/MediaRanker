class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :genre
      t.text :description
      t.integer :rank

      t.timestamps null: false
    end
  end
end
