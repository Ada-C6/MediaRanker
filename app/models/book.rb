class Book < ActiveRecord::Base
	validates :name, presence: true
  	validates :author, presence: true
end
