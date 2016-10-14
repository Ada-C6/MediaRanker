class Book < ActiveRecord::Base

  extend RankingModule

  validates_presence_of :title, message: "Title cannot be blank"
  validates_presence_of :author, message: "Author cannot be blank"
  validates_presence_of :description, message: "Description cannot be blank"
  validates_uniqueness_of :title, :scope => :author, message: "That book (combo of title and author) is already in the database"
  validates_uniqueness_of :author, :scope => :title, message: "That book (combo of title and author) is already in the database"

end
