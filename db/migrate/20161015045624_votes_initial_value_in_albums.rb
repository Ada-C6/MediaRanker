class VotesInitialValueInAlbums < ActiveRecord::Migration
  def change
    change_column :albums, :votes, :integer, { null: false, default: 0 }
  end
end
