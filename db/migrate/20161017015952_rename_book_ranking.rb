class RenameBookRanking < ActiveRecord::Migration
  def change
    rename_column :books, :book_ranking, :ranking
  end
end
