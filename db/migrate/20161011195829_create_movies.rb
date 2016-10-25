class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :creator
      t.string :description
      t.integer :rank

      t.timestamps null: false
    end
  end
end
