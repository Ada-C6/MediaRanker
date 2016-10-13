class Album < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :artist, presence: true

  def upvote
    self.rank += 1
  end
end
