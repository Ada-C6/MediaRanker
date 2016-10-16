class Movie < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :director, presence: true

  def upvote
    self.rank += 1
  end

  def self.order_descending
    Movie.order(rank: :desc)
  end

  def self.top_ten
    ordered = Movie.order_descending
    top_ten = ordered[0...10]
    return top_ten
  end
end
