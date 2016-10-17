class VotesDefaultZero < ActiveRecord::Migration
  def change
      change_column(:albums, :votes, :integer, :default => 0)
      change_column(:books, :votes, :integer, :default => 0)
      change_column(:movies, :votes, :integer, :default => 0)
  end
end
