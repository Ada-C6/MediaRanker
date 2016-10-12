class ChangeColumnToBy < ActiveRecord::Migration
  def change
    rename_column(:books, :written_by, :by)
    rename_column(:movies, :directed_by, :by)
    rename_column(:albums, :recorded_by, :by)    
  end
end
