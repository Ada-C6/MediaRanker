class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :by, presence: true

  def upvote
    self.ranked += 1
  end

  def self.by_rank
    Movie.all.order(:ranked).reverse
  end

  def self.top_ten
    return self.by_rank[0...10]
  end
end
