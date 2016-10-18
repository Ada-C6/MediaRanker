class RenameAlbumRanking < ActiveRecord::Migration
  def change
    rename_column :albums, :album_ranking, :ranking
  end
end
