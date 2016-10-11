class MoviesController < ApplicationController
  def index
    @movie = Movie.all
  end
  def show
    @movie = Movie.find(params[:id])
  end
  def edit
    @movie = Movie.find(params[:id])
  end
  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end
  private
  def movie_params
    params.require(:movie).permit(:name, :year, :description, :rank)
  end
end
