class CreateTopBooks < ActiveRecord::Migration
  def change
    create_table :top_books do |t|
      t.string :name
      t.string :author
      t.string :description
      t.integer :rank

      t.timestamps null: false
    end
  end
end
