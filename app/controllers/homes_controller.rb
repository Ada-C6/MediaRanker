class HomesController < ApplicationController
  def index
    @movies = Movie.all.order(:ranked).reverse
    @books = Book.all.order(:ranked).reverse
    @albums = Album.all.order(:ranked).reverse
  end
end
