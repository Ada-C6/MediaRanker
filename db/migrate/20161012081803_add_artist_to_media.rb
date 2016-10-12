class AddArtistToMedia < ActiveRecord::Migration
  def change
    add_column :media, :artist, :string
  end
end
