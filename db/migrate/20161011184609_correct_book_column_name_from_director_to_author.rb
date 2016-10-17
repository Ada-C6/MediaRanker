class CorrectBookColumnNameFromDirectorToAuthor < ActiveRecord::Migration
  def change
    rename_column :books, :director, :author
  end
end
