class Album < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :artist, presence: true
  validates :ranked, presence: true, numericality: { greater_than_or_equal_to: 0}

  def upvote
    ranked ? self.ranked += 1 : nil
  end
end
