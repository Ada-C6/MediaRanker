class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :rank
      t.text :synopsis

      t.timestamps null: false
    end
  end
end
