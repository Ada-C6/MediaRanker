class Movie < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name, :scope => :director

end
