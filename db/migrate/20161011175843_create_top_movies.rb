class CreateTopMovies < ActiveRecord::Migration
  def change
    create_table :top_movies do |t|
      t.string :name
      t.string :director
      t.string :description
      t.integer :rank

      t.timestamps null: false
    end
  end
end
