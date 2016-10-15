class Album < ActiveRecord::Base
  before_validation :correct_missing_artist, :initial_ranking

  validates :name, presence: :true, uniqueness: :true
  validates :artist, presence: :true

  def correct_missing_artist
    if self.artist.empty?
      self.artist = "unknown artist"
    end
  end

  def initial_ranking
    self.ranking = 0
  end
end
