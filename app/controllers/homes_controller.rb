class HomesController < ApplicationController
  def index
    # only showing the top 10 ranked items in each category
    @movies = Movie.all.order(:ranked).reverse.first(10)
    @books = Book.all.order(:ranked).reverse.first(10)
    @albums = Album.all.order(:ranked).reverse.first(10)
  end
end
