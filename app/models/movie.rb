class Movie < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :vote, allow_nil: true, numericality: { greater_than_or_equal_to: 0}

  def upvote
    self.vote += 1
  end

end
