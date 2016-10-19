class ChangeColumnsOnAllTablesToCreator < ActiveRecord::Migration
  def change
    rename_column :books, :author, :creator
    rename_column :movies, :director, :creator
    rename_column :albums, :artist, :creator
  end
end
