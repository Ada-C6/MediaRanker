class Album < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, length: {maximum: 50}

  def self.upvote(album)
   album.ranked += 1
   album.save
  end

  def self.rank
    Album.order(ranked: :desc)
  end
end
