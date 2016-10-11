class BookRankingRequiredWithDefaultValue < ActiveRecord::Migration
  def change
    change_column :books, :ranking, :integer, { null: false, default: 0 }
  end
end
