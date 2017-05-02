class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :type
      t.string :name
      t.string :auteur
      t.text :description
      t.integer :score

      t.timestamps null: false
    end
  end
end
