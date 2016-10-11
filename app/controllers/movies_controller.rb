class MoviesController < ApplicationController
  def findMovie
    return Movie.find(params[:id].to_i)
  end

  def index
    @movies = Movie.all
  end

  def show
    @movie = findAlbum
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
end
