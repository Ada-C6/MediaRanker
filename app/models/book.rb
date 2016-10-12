class Book < ActiveRecord::Base

  validates_presence_of :title, message: "Title cannot be blank"
  validates_presence_of :author, message: "Author cannot be blank"
  validates_presence_of :description, message: "Description cannot be blank"
  validates_uniqueness_of :title, :scope => :author, message: "That album (combo of title and artist) is already in the database"


  def self.top_ten
    return Book.order(upvotes: :desc).limit(10)
  end

  def self.all_ranked
    return Book.order(upvotes: :desc)
  end

end
