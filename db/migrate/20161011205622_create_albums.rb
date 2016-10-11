class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.text :description
      t.integer :upvotes, default: 0

      t.timestamps null: false
    end
  end
end
