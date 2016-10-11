class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
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
  end

  def update
  end

  def destroy
  end

  def upvote
  end
end
