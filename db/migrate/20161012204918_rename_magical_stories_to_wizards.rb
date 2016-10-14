class RenameMagicalStoriesToWizards < ActiveRecord::Migration
  def change
    rename_table :magical_stories, :wizards
  end
end
