class MoviesController < ApplicationController

  def find_n_sort_all
    @movies = Movie.all.sort {|a,b| b <=> a}
    # @books = Book.all.sort {|a,b| b <=> a}
    # @albums = Album.all.sort {|a,b| b <=> a}
  end

  def find_one
    return Album.find(params[:id].to_i)
  end

  def index
    find_n_sort_all
  end

  def show
    find_n_sort_all
    @movie = find_one
  end

  def new
    @movie = Movie.new
  end

  def create
    @params = params
    @movie = Album.new
    @movie.name = params[:movie][:name]
    @movie.director = params[:movie][:director]
    @movie.description = params[:movie][:description]
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
    redirect_to album_path(@movie.id)
  end

  def delete
    @movie = find_one
    @movie.destroy
    redirect_to movies_path
  end
end

private
def params
  params.require(:movie).permit(:name, :director, :description)
end
