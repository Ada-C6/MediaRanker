class ChangeNameOfColumnToVote < ActiveRecord::Migration
  def change
    rename_column :books, :votes, :vote
  end
end
