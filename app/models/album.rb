class Album < ActiveRecord::Base

  extend RankingModule

  validates_presence_of :title, message: "Title cannot be blank"
  validates_presence_of :artist, message: "Artist cannot be blank"
  validates_presence_of :description, message: "Description cannot be blank"
  validates_uniqueness_of :title, :scope => :artist, message: "That album (combo of title and artist) is already in the database"
  validates_uniqueness_of :artist, :scope => :title, message: "That album (combo of title and artist) is already in the database"

end
