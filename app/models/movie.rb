class Movie < ActiveRecord::Base
  validates :name, presence: true

  def self.most_votes
    order(:rank).reverse
  end
end
