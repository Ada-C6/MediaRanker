class MoviesController < ApplicationController
  def index
    @movie = Movie.all
    @movie.order
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
      redirect_to movie_path
    else
      render :edit
    end
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.rank += 1
    @movie.save
  redirect_to movie_path(@movie.id)
  end
  private
  def movie_params
    params.require(:movie).permit(:name, :year, :description, :rank)
  end
end
