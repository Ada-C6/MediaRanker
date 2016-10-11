class CreateMediaListings < ActiveRecord::Migration
  def change
    create_table :media_listings do |t|
      t.string :name
      t.string :creator
      t.string :description
      t.integer :ranking
      t.string :type

      t.timestamps null: false
    end
  end
end
