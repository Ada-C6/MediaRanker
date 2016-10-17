class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :artist, presence: true
  validates :description, presence: true

  def self.top_ten
    self.order(:rank).reverse_order.first(10)
  end

  
end
