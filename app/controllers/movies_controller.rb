class MoviesController < ApplicationController

  def index

  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end


  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to movies_path
  end


end
