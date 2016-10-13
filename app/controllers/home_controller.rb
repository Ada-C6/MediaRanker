class HomeController < ApplicationController
  def index
    @movies = Movie.all.sort_by_rank
    @books = Book.all.sort_by_rank
    @albums = Album.all.sort_by_rank
  end
end
