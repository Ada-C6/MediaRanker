class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :string
      t.string :written_by
      t.string :string
      t.string :ranked
      t.string :integer
      t.string :description
      t.string :string

      t.timestamps null: false
    end
  end
end
