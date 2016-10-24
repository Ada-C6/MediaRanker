class CreateTopAlbums < ActiveRecord::Migration
  def change
    create_table :top_albums do |t|
      t.string :name
      t.string :artist
      t.string :description
      t.integer :rank

      t.timestamps null: false
    end
  end
end
