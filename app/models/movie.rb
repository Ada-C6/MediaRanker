class Movie < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, :directed_by, presence: true
end
