class MoviesController < ApplicationController
  def index
    @movie = Movie.order(rank: :desc)
  end

  def show
    @movie = Movie.find(params[:id].to_i)
  end

  def new
    @movie = Movie.new
    @path = movies_path
  end

  def create
    @params = params
    @movie = Movie.new
    @movie.title = params[:movie][:title]
    @movie.director = params[:movie][:director]
    @movie.description = params[:movie][:description]
    @movie.rank = 0
    @movie.save
    redirect_to action: 'index'
  end

  def edit
    @movie = Movie.find(params[:id].to_i)
    @path = movie_path
  end

  def update
    @params = params
    @movie = Movie.find(params[:id].to_i)
    @movie.title = params[:movie][:title]
    @movie.director = params[:movie][:director]
    @movie.description = params[:movie][:description]
    @movie.save
    redirect_to action: 'show'
  end

  def upvote
    @movie = Movie.find(params[:id].to_i)
    @movie.rank += 1
    @movie.save

    redirect_to :back
  end

  def destroy
    @movie = Movie.find(params[:id].to_i)
    @movie.destroy

    redirect_to movies_path
  end
end
