class Movie < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :director, presence: true

  def upvote
    self.rank += 1
  end
end
