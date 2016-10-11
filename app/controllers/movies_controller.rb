class MoviesController < ApplicationController
  def index
    @movie_list = Movie.all
  end

  def show
    @this_movie = Movie.find(params[:id])
  end

  def new
    @new_movie = Movie.new
  end

  def create
    @new_movie = Movie.new
    @new_movie.save

    if @new_movie.update(movie_params)
      redirect_to movies_path
    else
      render :new
    end

  end

  def edit
    @this_movie = Movie.find(params[:id])
  end

  def update
    @this_movie = Movie.find(params[:id])
    if @this_movie.update(movie_params)
      redirect_to movie_path(m)
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :description)
  end


end
