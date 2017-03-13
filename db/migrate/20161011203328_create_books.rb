class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :creator
      t.text :description
      t.integer :rank

      t.timestamps null: false
    end
  end
end
