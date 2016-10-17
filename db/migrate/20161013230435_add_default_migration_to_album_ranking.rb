class AddDefaultMigrationToAlbumRanking < ActiveRecord::Migration
  def change
    change_column :albums, :ranking, :integer, default: 0
    change_column :books, :ranking, :integer, default: 0
    change_column :movies, :ranking, :integer, default: 0
  end
end
