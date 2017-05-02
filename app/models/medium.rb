class Medium < ActiveRecord::Base
  validates :name, presence: true
  validates :auteur, presence: true
  validates :score, numericality: {greater_than_or_equal_to: 0}
  validate :validate_category
  
  def validate_category
    unless category == "Movie" || category == "Book" || category == "Song"
      errors[:category] << "Not an available category"
    end
  end
end
