class CreateLeslieVotes < ActiveRecord::Migration
  def change
    create_table :leslie_votes do |t|
      t.integer :leslie_id

      t.timestamps null: false
    end
  end
end
