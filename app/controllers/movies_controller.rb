class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(ranking: :desc)
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
