class HomesController < ApplicationController
  def index
    records = 10
    @books = Book.limit(records).order('votes desc')
    @movies = Movie.limit(records).order('votes DESC')
    @albums = Album.limit(records).order('votes DESC')
  end
end
