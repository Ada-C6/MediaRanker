class MainController < ApplicationController

  def index
    @movies = Movie.all.order(:upvotes).reverse
    @books = Book.all.order(:upvotes).reverse
    @albums = Album.all.order(:upvotes).reverse
  end


end
