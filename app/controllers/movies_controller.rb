class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
    @movie_method = :post
    @movie_path = "/movies"
  end

  def create
    @movie = Movie.new
    @movie.name = params[:movie][:name]
    @movie.director = params[:movie][:director]
    @movie.description = params[:movie][:description]
    @movie.rank = 0
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      redirect_to new_movie_path
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    @movie_method = :put
    @movie_path = movie_path
  end

  def update
    Movie.update(params[:id], :name => params[:movie][:name],
                              :director => params[:movie][:director],
                              :description => params[:movie][:description])
    redirect_to movie_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path

  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.rank += 1
    @movie.save
    redirect_to movie_path
  end
end
