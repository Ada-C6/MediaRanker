class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :description
      t.integer :upvotes

      t.timestamps null: false
    end
  end
end
