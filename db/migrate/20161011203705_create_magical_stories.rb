class CreateMagicalStories < ActiveRecord::Migration
  def change
    create_table :magical_stories do |t|
      t.string :title
      t.string :author_director
      t.string :main_character

      t.timestamps null: false
    end
  end
end
