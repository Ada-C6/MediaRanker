class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name
      t.integer :votes
      t.string :description

      t.timestamps null: false
    end
  end
end
