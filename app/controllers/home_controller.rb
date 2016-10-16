class HomeController < ApplicationController
  def index
    @movies = Movie.all.order(:rank).reverse_order
    @books = Book.all.order(:rank).reverse_order
    @albums = Album.all.order(:rank).reverse_order
  end
end
