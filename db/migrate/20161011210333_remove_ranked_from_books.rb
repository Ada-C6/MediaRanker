class RemoveRankedFromBooks < ActiveRecord::Migration
  def change
   change_column :books, :ranked, :integer
  end
end
