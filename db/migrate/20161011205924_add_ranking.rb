class AddRanking < ActiveRecord::Migration
  def change
    add_column(:books, :rank, :fixnum)
  end
end
