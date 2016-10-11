class LandingsController < ApplicationController
  def index
    @movies = Movie.order(rank: :desc).limit(7)
    @books = Book.order(rank: :desc).limit(7)
    @songs = Song.order(rank: :desc).limit(7)
  end

  def show
  end
end
