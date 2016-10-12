class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(ranking: :desc)
  end

  def show
    @movie = Movie.find(params[:id])
  end


  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.ranking += 1
    @movie.save
    redirect_to movie_path(@movie)
  end
end
