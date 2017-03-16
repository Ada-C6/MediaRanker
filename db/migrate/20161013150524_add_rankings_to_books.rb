class AddRankingsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :rankings, :integer
  end
end
