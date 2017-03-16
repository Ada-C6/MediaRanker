class CreateCapstones < ActiveRecord::Migration
  def change
    create_table :capstones do |t|
      t.string :name
      t.integer :ranking
      t.text :description

      t.timestamps null: false
    end
  end
end
