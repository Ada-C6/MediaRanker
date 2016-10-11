class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :string
      t.string :recorded_by
      t.string :string
      t.string :ranked
      t.string :integer
      t.string :description
      t.string :string

      t.timestamps null: false
    end
  end
end
