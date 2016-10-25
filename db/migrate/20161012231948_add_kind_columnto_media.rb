class AddKindColumntoMedia < ActiveRecord::Migration
  def change
  	add_column :media, :kind, :string
  end
end
