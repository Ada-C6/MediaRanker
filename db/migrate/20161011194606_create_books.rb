class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :num_votes
      t.string :author
      t.text :description

      t.timestamps null: false
    end
  end
end
