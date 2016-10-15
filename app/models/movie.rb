class Movie < ActiveRecord::Base
  before_validation :correct_missing_director
  before_validation :initial_ranking, on: [:save, :create]

  validates :name, presence: :true, uniqueness: :true
  validates :director, presence: :true
  validates :ranking, numericality: { greater_than_or_equal_to: 0 }

  def correct_missing_director
    if self.director.blank?
      self.director = "Unattributed"
    end
  end

  def initial_ranking
    if self.ranking.blank?
      self.ranking = 0
    end
  end
end
