class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :director, presence: true
  validates :description, presence: true

  def self.top_ten
    self.order(:rank).reverse_order.first(10)
  end
end
