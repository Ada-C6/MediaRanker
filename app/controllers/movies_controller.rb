class MoviesController < ApplicationController

  def index
    @full_list = Movie.all
  end

  def show
    id = Integer(params[:id])
    @this_item = Movie.find(id)
  end

  def new
    @new_item = Movie.new
  end
end
