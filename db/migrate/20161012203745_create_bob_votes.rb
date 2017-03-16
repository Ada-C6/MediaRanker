class CreateBobVotes < ActiveRecord::Migration
  def change
    create_table :bob_votes do |t|
      t.integer :bob_id

      t.timestamps null: false
    end
  end
end
