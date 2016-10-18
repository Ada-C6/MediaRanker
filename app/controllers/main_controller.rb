class MainController < ApplicationController
  def index
    @movie_list_by_votes = Movie.order(:votes).reverse
    @book_list_by_votes = Book.order(:votes).reverse
    @album_list_by_votes = Album.order(:votes).reverse
  end
end
