class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.ranking += 1
    redirect_to movies_path # change to individual movie show view
  end

  def new
  end

  def create
  end

  def destroy
  end
end
