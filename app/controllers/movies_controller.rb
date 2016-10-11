class MoviesController < ApplicationController
  def index
  end

  def show
    @this_movie=Movie.find(params[:id])
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end

  def upvote 
    @this_movie=Movie.find(params[:id])
    @this_movie.rank+=1
    @this_movie.save
    redirect_to movie_url(@this_movie)
  end
end
