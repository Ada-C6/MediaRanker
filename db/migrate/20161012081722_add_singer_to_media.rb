class AddSingerToMedia < ActiveRecord::Migration
  def change
    add_column :media, :singer, :string
  end
end
