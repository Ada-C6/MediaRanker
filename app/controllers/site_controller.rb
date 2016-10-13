class SiteController < ApplicationController
  def index
    @albums = Album.all.order(ranking: :desc)
    @books = Book.all.order(ranking: :desc)
    @movies = Movie.all.order(ranking: :desc)
  end
end
