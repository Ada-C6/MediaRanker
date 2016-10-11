class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :directed_by
      t.integer :ranked, default: 0
      t.string :description

      t.timestamps null: false
    end
  end
end
