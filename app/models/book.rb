class Book < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true

  def upvote
    self.rank += 1
  end

  def self.order_descending
    Book.order(rank: :desc)
  end

  def self.top_ten
    ordered = Book.order_descending
    top_ten = ordered[0...10]
    return top_ten
  end
end
