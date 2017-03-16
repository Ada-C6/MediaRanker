class CreateBobs < ActiveRecord::Migration
  def change
    create_table :bobs do |t|
      t.string :name
      t.string :appears_in
      t.string :identifying_quality

      t.timestamps null: false
    end
  end
end
