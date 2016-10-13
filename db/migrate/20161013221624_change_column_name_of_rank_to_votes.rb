class ChangeColumnNameOfRankToVotes < ActiveRecord::Migration
  def change
      rename_column(:albums, :rank, :votes)
      rename_column(:books, :rank, :votes)
      rename_column(:movies, :rank, :votes)
  end
end
