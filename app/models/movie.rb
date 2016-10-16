class Movie < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, length: {maximum: 50}

    def self.upvote(movie)
     movie.ranked += 1
     movie.save
    end

   def self.rank
    Movie.order(ranked: :desc)
   end
end
