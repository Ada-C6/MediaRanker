class AddAuthorToMedia < ActiveRecord::Migration
  def change
    add_column :media, :author, :string
  end
end
