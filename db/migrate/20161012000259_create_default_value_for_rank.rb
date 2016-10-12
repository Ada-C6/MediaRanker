class CreateDefaultValueForRank < ActiveRecord::Migration
  def change
    create_table :default_value_for_ranks do |t|
      change_column :movies, :rank, :integer, :default => 0
      change_column :books, :rank, :integer, :default => 0
      change_column :albums, :rank, :integer, :default => 0
    end
  end
end
