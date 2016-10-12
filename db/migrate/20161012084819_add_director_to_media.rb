class AddDirectorToMedia < ActiveRecord::Migration
  def change
    add_column :media, :director, :string
  end
end
