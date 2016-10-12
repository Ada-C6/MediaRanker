class AddVoteCountToAllModels < ActiveRecord::Migration
  def change
    add_column :movies, :vote_count, :integer
    add_column :books, :vote_count, :integer
    add_column :albums, :vote_count, :integer 
  end
end
