class MainsController < ApplicationController
  def index
    @movies = Movie.top_ten
    @books = Book.top_ten
    @albums = Album.top_ten
  end
end
