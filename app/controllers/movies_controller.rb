class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(ranking: :desc)
  end
end
