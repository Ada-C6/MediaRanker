class SiteController < ApplicationController
  def index
    @top_albums = Album.all.order(ranking: :desc).take(10)
    @top_books = Book.all.order(ranking: :desc).take(10)
    @top_movies = Movie.all.order(ranking: :desc).take(10)
  end
end
