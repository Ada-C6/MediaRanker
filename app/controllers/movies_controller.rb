class MoviesController < ApplicationController
  def index
    @movies_by_rank = Movie.order(:rank).reverse
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.rank = 0

    if @movie.save
      # saved successfully
      redirect_to movie_path(@movie.id)
    else
      # did not save
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      # saved successfully
      redirect_to movie_path
    else
      # did not save
      render :edit
    end
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.rank += 1
    @movie.save

    #redirects back to where the request came from
    redirect_to :back
    # redirect_to movie_path(@movie.id)
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :description, :rank)
  end

end
