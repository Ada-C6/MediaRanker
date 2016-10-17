class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(:ranking).reverse
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.ranking = 0
    @movie.save
    redirect_to movies_path
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update
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

####### STRONG PARAMS ##############
  private
  def movie_params
    params.require(:movie).permit(:id, :name, :director, :description, :ranking)
  end
end
