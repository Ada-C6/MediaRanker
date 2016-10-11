class WelcomeController < ApplicationController
  def index
  # displayed media are ordered by highest upvotes/rank
    @movies = Movie.order(upvotes: :desc)

  end
end
