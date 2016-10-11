class RemoveType < ActiveRecord::Migration
  def change
    remove_column :media, :type, :string 
  end
end
