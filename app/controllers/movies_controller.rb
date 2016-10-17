class MoviesController < ApplicationController

  def index
    @movies = Movie.order(upvotes: :desc)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    # media starts out with zero and not nill upvotes.
    @movie.upvotes = 0
    if @movie.save
      redirect_to movie_path(@movie)
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
      redirect_to movie_path(@movie)
    else
      render :edit

    end
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.upvote

    redirect_to movie_path(@movie)
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :description)
  end

end
