class HomeController < ApplicationController
  def index

    @movies = Movie.order(ranked: :desc).limit(10)
    @albums = Album.order(ranked: :desc).limit(10)
    @books = Book.order(ranked: :desc).limit(10)
  end
end
