class MovieNameRequiredField < ActiveRecord::Migration
  def change
    change_column :movies, :name, :string, { null: false }
  end
end
