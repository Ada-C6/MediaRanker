class AddVotesSpace < ActiveRecord::Migration
  def change
    add_column :media, :votes, :integer
  end
end
