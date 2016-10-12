class Movie < ActiveRecord::Base
  def self.by_rank
    self.all.order(:ranked).reverse
  end
end
