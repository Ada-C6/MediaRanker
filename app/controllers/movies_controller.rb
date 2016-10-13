class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(:ranked).reverse
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
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.upvote
    @movie.save

    redirect_to movie_path(@movie.id)
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :description, :ranked)
  end
end
