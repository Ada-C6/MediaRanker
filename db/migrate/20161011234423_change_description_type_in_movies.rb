class ChangeDescriptionTypeInMovies < ActiveRecord::Migration
  def change
    change_column :movies, :description, :text
  end
end
