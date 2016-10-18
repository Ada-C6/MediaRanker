class MoviesController < ApplicationController

  def index
    @movies = Movie.all.order(:ranking).reverse
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      #SUCCESS
      redirect_to movies_path
    else
      #UNSUCCESSFUL
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
          # SUCCESS
          redirect_to movie_path
        else
          # UNSUCCESSFUL
          render :edit
        end
  end

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.increment!(:ranking)
    redirect_to movie_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :description)
  end


end
