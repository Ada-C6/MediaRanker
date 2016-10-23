class Seinfeld < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :season, presence: true
  validates :episode, presence: true
  validates :rank, presence: true

  def upvote
    self.rank += 1
    self.save
  end

  def downvote
    self.rank -= 1
    self.save
  end
end
