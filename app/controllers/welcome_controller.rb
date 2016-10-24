class WelcomeController < ApplicationController
  def index
    @movies_by_rank = Movie.order(:rank).reverse.first(3)
    @books_by_rank = Book.order(:rank).reverse.first(3)
    @albums_by_rank = Album.order(:rank).reverse.first(3)
  end
end
