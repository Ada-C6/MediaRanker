class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :recorded_by
      t.text :description

      t.timestamps null: false
    end
  end
end
