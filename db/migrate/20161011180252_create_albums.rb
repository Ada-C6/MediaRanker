class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :recorded_by
      t.integer :ranked, default: 0
      t.string :description

      t.timestamps null: false
    end
  end
end
