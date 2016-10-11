class MoviesController < ApplicationController
  def index
    @movie = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movie_path
    else
      render :new
    end
  end

  def edit  # Will give the form, like new
    @movie = Movie.find(params[:id])
  end

  def update # Actually do the update, like create
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id]).destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :description)
  end
end
