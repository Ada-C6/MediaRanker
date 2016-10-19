class SetDefaultsOthers < ActiveRecord::Migration
  def change
      change_column :books, :rank, :integer, default: 0
      change_column :albums, :rank, :integer, default: 0
  end
end
