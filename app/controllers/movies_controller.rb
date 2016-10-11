class MoviesController < ApplicationController
  def index
    @movies = Movie.order('ranking DESC')
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def all_media
    @movies = Movie.order('ranking DESC')
  end

  def upvote
    @movie = show
    @movie.ranking += 1
    @movie.save

    redirect_to :movie
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.ranking = 0
    if @movie.save
      #SUCCESS
      redirect_to movie_path(@movie)
    else
      #NOPE
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = edit
    if @movie.update(movie_params)
      #SUCCESS
      redirect_to movie_path(@movie)
    else
      #NOPE
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
