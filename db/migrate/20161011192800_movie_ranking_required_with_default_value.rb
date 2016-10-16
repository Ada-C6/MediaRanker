class MovieRankingRequiredWithDefaultValue < ActiveRecord::Migration
  def change
    change_column :movies, :ranking, :integer, { null: false, default: 0 }
  end
end
