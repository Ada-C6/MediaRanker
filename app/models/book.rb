class Book < ActiveRecord::Base
  before_validation :correct_missing_author
  before_validation :initial_ranking, on: [:save, :create]

  validates :name, presence: :true, uniqueness: :true
  validates :author, presence: :true
  validates :ranking, numericality: { greater_than_or_equal_to: 0 }

  def correct_missing_author
    if self.author.blank?
      self.author = "Anonymous"
    end
  end

  def initial_ranking
    if self.ranking.blank?
      self.ranking = 0
    end
  end
end
