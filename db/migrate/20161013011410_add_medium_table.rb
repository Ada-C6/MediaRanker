class AddMediumTable < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :type
      t.string :name
      t.string :creator
      t.text :description
    end
    [:albums, :movies, :books].each do |t|
    drop_table t
  end
  end
end
