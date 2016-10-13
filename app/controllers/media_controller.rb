class MediaController < ApplicationController
  def index
    @movies = Movie.all.limit(10)
    @books = Book.all.limit(10)
    @albums = Album.all.limit(10)
  end
end
