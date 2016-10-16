class AlbumRankingRequiredWithDefaultValue < ActiveRecord::Migration
  def change
    change_column :albums, :ranking, :integer, { null: false, default: 0 }
  end
end
