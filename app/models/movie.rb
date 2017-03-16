class Movie < ActiveRecord::Base

  extend RankingModule

  validates_presence_of :title, message: "Title cannot be blank"
  validates_presence_of :director, message: "Director cannot be blank"
  validates_presence_of :description, message: "Description cannot be blank"
  validates_uniqueness_of :title, :scope => :director, message: "That movie (combo of title and director) is already in the database"
  validates_uniqueness_of :director, :scope => :title, message: "That movie (combo of title and director) is already in the database"

end
