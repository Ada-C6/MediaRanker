class SiteController < ApplicationController
  def index
    @top_movies = Movie.top_ten
    # This should be in the movie model.

    @top_books = Book.top_ten

    @top_albums =
    Album.top_ten

  end
end
