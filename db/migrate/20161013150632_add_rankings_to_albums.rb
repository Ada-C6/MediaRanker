class AddRankingsToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :rankings, :integer
  end
end
