class Movie < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :director }
end
