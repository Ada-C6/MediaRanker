class RenameMovieRanking < ActiveRecord::Migration
  def change
    rename_column :movies, :movie_ranking, :ranking
  end
end
