class ChangeTypeOfVotesColumnAndAddDefultValue < ActiveRecord::Migration
  def up
      change_column :media, :votes, :integer, default: 0, null: false
  end

  def down
      change_column :media, :votes, :text
  end

end
