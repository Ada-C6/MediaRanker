class CreateWizardVotes < ActiveRecord::Migration
  def change
    create_table :wizard_votes do |t|
      t.integer :wizard_id

      t.timestamps null: false
    end
  end
end
