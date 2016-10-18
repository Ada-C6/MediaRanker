class VotesInitialValueInBooks < ActiveRecord::Migration
  def change
    change_column :books, :votes, :integer, { null: false, default: 0 }
  end
end
