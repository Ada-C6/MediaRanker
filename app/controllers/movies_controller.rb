class MoviesController < ApplicationController

  def find_n_sort_all
    # @movies = Movie.all
    @movies = Movie.all.sort_by {|movie| movie.votes}.reverse
  end

  def find_one
    return Movie.find(params[:id].to_i)
  end

  def index
    find_n_sort_all
  end

  def show
    @movie = find_one
  end

  def new
    @movie = Movie.new
    @path_name = movies_path
  end

  def create
    @params = params
    @movie = Movie.new
    @movie.name = params[:movie][:name]
    @movie.director = params[:movie][:director]
    @movie.description = params[:movie][:description]
    @movie.votes = 0
    @movie.save
    redirect_to movie_path(@movie.id)
  end

  def edit
    show
  end

  def update
    @params = params
    @movie = find_one
    @movie.name = params[:movie][:name]
    @movie.director = params[:movie][:director]
    @movie.description = params[:movie][:description]
    @movie.save
    redirect_to movie_path(@movie.id)
  end

  def upvote
    @movie = find_one
    @movie.votes += 1
    @movie.save
    redirect_to movies_path
  end

  def destroy
    @movie = find_one
    @movie.destroy
    redirect_to movies_path
  end
end

private
def params
  params.require(:movie).permit(:name, :director, :description, :votes)
end
