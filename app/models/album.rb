class Album < ActiveRecord::Base

  validates_presence_of :title, message: "Title cannot be blank"
  validates_presence_of :artist, message: "Artist cannot be blank"
  validates_presence_of :description, message: "Description cannot be blank"
  validates_uniqueness_of :title, :scope => :artist, message: "That album (combo of title and artist) is already in the database"
  validates_uniqueness_of :artist, :scope => :title, message: "That album (combo of title and artist) is already in the database"

  def self.top_ten
    return Album.order(upvotes: :desc).limit(10)
  end

  def self.all_ranked
    return Album.order(upvotes: :desc)
  end

end
