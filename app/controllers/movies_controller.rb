class MoviesController < ApplicationController
  def index
    @movies = Movie.order('ranking DESC')
  end

  def show
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.ranking += 1
    @movie.save

    redirect_to movies_path # change to individual movie show view
  end

  def new
  end

  def create
  end

  def destroy
  end
end
