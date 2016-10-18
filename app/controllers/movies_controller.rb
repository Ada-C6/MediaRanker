class MoviesController < ApplicationController

  def index
    @movie = Movie.all.most_votes
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
      redirect_to movie_path
    else
      render :edit
    end
  end

  def upvote
      @movie = Movie.find(params[:id])
      @movie.rank += 1
      @movie.save
      redirect_to movie_path(@movie.id)
  end

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :year, :description)
  end

end
