class SiteController < ApplicationController
  def index
    @top_movies = Movie.order(:rank).reverse_order.first(10)
    # This should be in the movie model.
    @top_books = Book.order(:rank).reverse_order.first(10)

    @top_albums =
    Album.order(:rank).reverse_order.first(10)

  end
end
