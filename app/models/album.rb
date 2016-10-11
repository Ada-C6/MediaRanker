class Album < ActiveRecord::Base

    validates :name, presence: true
    validates :artist, presence: true
    validates :description, presence: true, length: { in: 1..200 }

end
