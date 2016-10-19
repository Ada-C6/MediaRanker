class HomeController < ApplicationController
  def index
    @movies = Movie.all.order('rank DESC NULLS LAST')
    @books = Book.all.order('rank DESC NULLS LAST')
    @albums = Album.all.order('rank DESC NULLS LAST')
  end
end
