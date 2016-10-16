class RemoveCategory < ActiveRecord::Migration
  def change
    remove_column :media, :category, :string 
  end
end
