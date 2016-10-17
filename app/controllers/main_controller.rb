class MainController < ApplicationController
  def index
    @movie_list = Movie.all
    @book_list = Book.all
    @album_list = Album.all
  end
end
