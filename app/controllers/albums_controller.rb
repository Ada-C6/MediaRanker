class AlbumsController < ApplicationController

  def find_n_sort_all
    # @movies = Movie.all.sort {|a,b| b <=> a}
    # @books = Book.all.sort {|a,b| b <=> a}
    @albums = Album.all.sort {|a,b| b <=> a}
  end

  def find_one
    return Album.find(params[:id].to_i)
  end

  def index
    find_n_sort_all
  end

  def show
    find_n_sort_all
    @album = find_one
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end

private
def params
  params.require(:album).permit(:name, :artist, :description)
end
