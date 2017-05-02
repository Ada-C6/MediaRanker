class ChangeMediaTypetoCategory < ActiveRecord::Migration
  def change
    remove_column :media, :type, :string
    add_column :media, :category, :string
  end
end
