class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.rank = 0
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :description)
  end
end
