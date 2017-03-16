class CreateVotingSessions < ActiveRecord::Migration
  def change
    create_table :voting_sessions do |t|
      t.integer :voting_id

      t.timestamps null: false
    end
  end
end
