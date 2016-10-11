class WelcomeController < ApplicationController
  def index
  # displayed media are ordered by highest upvotes/rank
    @movies = Movie.order(upvotes: :desc)
    @books  = Book.order(upvotes: :desc)
    @albums = Album.order(upvotes: :desc)

  end
end
