class VotesInitialValueInMovies < ActiveRecord::Migration
  def change
      change_column :movies, :votes, :integer, { null: false, default: 0 }
  end
end
