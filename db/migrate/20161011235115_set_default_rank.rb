class SetDefaultRank < ActiveRecord::Migration
  def change
    change_column :movies, :rank, :integer, default: 0
  end
end
