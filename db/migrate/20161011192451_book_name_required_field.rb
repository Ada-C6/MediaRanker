class BookNameRequiredField < ActiveRecord::Migration
  def change
    change_column :books, :name, :string, { null: false }
  end
end
