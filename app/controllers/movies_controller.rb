class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @mymovies = Movie.find(params[:id])
  end


  def new
    @mymovies = Movie.new
  end

  def create
  end

  def edit
    @mymovies = Movie.find(params[:id].to_i)
  end

  def update
    @mymovies = Movie.find(params[:id])
  end



  def delete
  end
end
