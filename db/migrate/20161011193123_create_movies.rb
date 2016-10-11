class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :directed_by
      t.integer :ranked
      t.string :description

      t.timestamps null: false
    end
  end
end
