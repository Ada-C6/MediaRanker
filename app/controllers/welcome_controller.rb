class WelcomeController < ApplicationController
  def index
    @movies_by_rank = Movie.order(:rank).reverse
    @books_by_rank = Book.order(:rank).reverse
    @albums_by_rank = Album.order(:rank).reverse
  end
end
