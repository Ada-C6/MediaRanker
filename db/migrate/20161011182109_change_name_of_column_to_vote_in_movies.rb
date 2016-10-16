class ChangeNameOfColumnToVoteInMovies < ActiveRecord::Migration
  def change
    rename_column :movies, :votes, :vote

  end
end
