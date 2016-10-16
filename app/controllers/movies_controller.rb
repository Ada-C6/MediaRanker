class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order('rank DESC NULLS LAST')
  end

  def show
    begin
      @movie = Movie.find(params[:id])
    rescue ActiveRecord::RecordNotFound => err
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
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

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    Movie.increment_counter(:rank, @movie)
    redirect_to movie_path(@movie)
  end

# ---- PRIVATE METHODS ----

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :description, :rank)
  end
end
