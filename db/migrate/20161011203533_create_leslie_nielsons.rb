class CreateLeslieNielsons < ActiveRecord::Migration
  def change
    create_table :leslie_nielsons do |t|
      t.string :title
      t.string :part
      t.integer :year

      t.timestamps null: false
    end
  end
end
