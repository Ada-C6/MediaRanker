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
end
