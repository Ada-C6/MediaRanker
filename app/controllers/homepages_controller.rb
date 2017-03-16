class HomepagesController < ApplicationController
  def index
    @albums = Album.order(rank: :desc).limit(10)
    @books = Book.order(rank: :desc).limit(10)
    @movies = Movie.order(rank: :desc).limit(10)
  end

end
