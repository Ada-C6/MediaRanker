class MoviesController < ApplicationController
  def index
    @movies = Movie.order(rank: :desc).all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(title: params[:movie][:title], year: params[:movie][:year], synopsis: params[:movie][:synopsis])
    @movie.rank = 0
    @movie.save

    redirect_to index_movies_url
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.update(params[:id], title: params[:movie][:title], year: params[:movie][:year], synopsis: params[:movie][:synopsis])

    redirect_to index_movies_url
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.increment!(:rank)

    redirect_to show_movies_url
  end

  def destroy
    Movie.destroy(params[:id])

    redirect_to index_movies_url
  end

end
