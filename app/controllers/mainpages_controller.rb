class MainpagesController < ApplicationController
  def index
    @movies = Movie.rank.limit(8)
    @books = Book.rank.limit(8)
    @albums = Album.rank.limit(8)
  end
end
