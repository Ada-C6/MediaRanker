class Movie < ActiveRecord::Base
  validates :name, presence: true

  def self.sort_by_rank
    order('rank DESC')
  end
end
