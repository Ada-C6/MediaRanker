class RenameMoviesTableToArchiveMovies < ActiveRecord::Migration
  def change
    rename_table :movies, :archive_movies
  end
end
