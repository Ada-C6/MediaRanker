class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.upvote
    redirect_to movie_path
  end

private

  def movie_params
    params.require(:movie).permit(:name, :director, :description)
  end

end
