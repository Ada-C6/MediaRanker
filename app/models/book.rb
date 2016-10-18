class Book < ActiveRecord::Base
  validates :title, presence: true

  def self.most_votes
    order(:rank).reverse
  end
end
