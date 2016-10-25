class MediasController < ApplicationController
  def index
    @movies = Movie.order(rank: :desc).limit(10)
    @books = Book.order(rank: :desc).limit(10)
    @albums = Album.order(rank: :desc).limit(10)
  end
end
