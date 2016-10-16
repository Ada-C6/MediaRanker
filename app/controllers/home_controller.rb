class HomeController < ApplicationController

  def index
    @movies = Movie.all
    @books = Book.all
    @albums = Album.all

    @movies = @movies.order(ranking: :desc)
    @books = @books.order(ranking: :desc)
    @albums = @albums.order(ranking: :desc)
  end

end
