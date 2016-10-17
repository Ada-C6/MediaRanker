class HomepageController < ApplicationController
  def index
    @albums = Album.all.where("ranking != '0'").order(:ranking).reverse.first(10)
    @books = Book.all.where("ranking != '0'").order(:ranking).reverse.first(10)
    @movies = Movie.all.where("ranking != '0'").order(:ranking).reverse.first(10)
  end
end
