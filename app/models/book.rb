class Book < ActiveRecord::Base

  validates :name, presence: true
  validates :author, presence: true
  validates :description, presence: true

  # def upvote
  #   @book.rank += 1
  #   self.save
  # end

end
