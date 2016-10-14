class RenameLeslieNielsonsToLeslies < ActiveRecord::Migration
  def change
    rename_table :leslie_nielsons, :leslies
  end
end
