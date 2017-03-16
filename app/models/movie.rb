class Movie < ActiveRecord::Base

  validates_presence_of :title, message: "Title cannot be blank"
  validates_presence_of :director, message: "Director cannot be blank"
  validates_presence_of :description, message: "Description cannot be blank"
  validates_uniqueness_of :title, :scope => :director, message: "That movie (combo of title and director) is already in the database"
  validates_uniqueness_of :director, :scope => :title, message: "That movie (combo of title and director) is already in the database"

  def self.top_ten
    return Movie.order(upvotes: :desc).limit(10)
  end

  def self.all_ranked
    return Movie.order(upvotes: :desc)
  end

end
