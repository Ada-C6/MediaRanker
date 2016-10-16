class Movie < ActiveRecord::Base
  validates :name, presence: true
  validates :director, presence: true

  def self.sort_by_rank
    # order('rank DESC') gets me the behavior I want on
    # local machine, but doesn't work when deployed to
    # heroku
    order(:rank)
  end
end
