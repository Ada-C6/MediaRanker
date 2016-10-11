class BooksDirectorToAuthor < ActiveRecord::Migration
  def change
    remove_column :books, :director, :string
    add_column :books, :author, :string
  end
end
