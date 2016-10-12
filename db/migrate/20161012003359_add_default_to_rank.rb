class AddDefaultToRank < ActiveRecord::Migration
  def change
    [:books, :movies, :albums].each do |table|
      change_column_default(table, :rank, 0)
    end
  end
end
