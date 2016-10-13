class Movie < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { scope: :director, :message => "This movie with this director has already been created" }
  validates :director, presence: true
  validates :description, presence: true
end
