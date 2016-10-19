class ChangeColumnType < ActiveRecord::Migration

def up
    change_column :media, :votes, :text
end

def down
    change_column :media, :votes, :integer
end
end
