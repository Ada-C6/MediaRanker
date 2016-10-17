class Book < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, length: {maximum: 50}

  def self.upvote(book)
   book.ranked += 1
   book.save
  end

 def self.rank
  Book.order(ranked: :desc)
 end
end
