class AddRankingsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :rankings, :integer
  end
end
