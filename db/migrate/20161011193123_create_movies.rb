class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :string
      t.string :directed_by
      t.string :string
      t.string :ranked
      t.string :integer
      t.string :description
      t.string :string

      t.timestamps null: false
    end
  end
end
