class Movie < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :director, presence: true
  validates :ranked, allow_nil: true, numericality: { greater_than_or_equal_to: 0}

  def upvote
    ranked ? self.ranked += 1 : self.ranked = 1
  end
end
