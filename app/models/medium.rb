class Medium < ActiveRecord::Base
  has_many :albums
  has_many :books
  has_many :movies
end
