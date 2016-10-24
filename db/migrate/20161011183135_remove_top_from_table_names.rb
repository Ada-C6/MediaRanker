class RemoveTopFromTableNames < ActiveRecord::Migration
  def change
    rename_table :top_movies, :movies
    rename_table :top_books, :books
    rename_table :top_albums, :albums
  end
end
