class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :num_votes
      t.string :director
      t.text :description

      t.timestamps null: false
    end
  end
end
