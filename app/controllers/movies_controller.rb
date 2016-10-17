class MoviesController < ApplicationController

  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @movies= Movie.rank
  end

  def show; end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to movie_path
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:movie_id])
    Movie.upvote(@movie)
    redirect_to movie_path(@movie)
  end

  private
   def movie_params
      params.require(:movie).permit(:name, :director, :description)
    end

    def find_params
      @movie = Movie.find(params[:id])
    end
end
