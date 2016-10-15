class LandingsController < ApplicationController
  def index
    @movies = Movie.order('rank desc, id').limit(7)
    @books = Book.order('rank desc, id').limit(7)
    @songs = Song.order('rank desc, id').limit(7)
    @seinfelds = Seinfeld.order('rank desc, id').limit(7)
  end

  def show
  end
end
