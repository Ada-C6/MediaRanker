class MoviesController < ApplicationController
  attr_reader :upvote

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id].to_i)
  end

  def new
    @newmovie = Movie.new
  end

  def create
    @newmovie = Movie.new

    @newmovie.title = params[:movie][:title]
    @newmovie.director = params[:movie][:director]
    @newmovie.description = params[:movie][:description]
    @newmovie.rank = 0

    @newmovie.save

    redirect_to action: 'index'
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.title = params[:movie][:title]
    @movie.director = params[:movie][:director]
    @movie.description = params[:movie][:description]

    @movie.save

    redirect_to action: 'index'
  end

  def destroy
    Movie.find(params[:id]).destroy

    redirect_to action: 'index'
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.rank += 1
    @movie.save

    # This ensures users stay on current page when hitting the upvote button_to
    # I think this is a better user experience :)
    redirect_to :back
  end
end
