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
    @album = Album.new
  end

  def create
    @params = params
    @album = Album.new
    @album.name = params[:album][:name]
    @album.artist = params[:album][:artist]
    @album.description = params[:album][:description]
    @album.save
    redirect_to album_path(@album.id)
  end

  def edit
    show
  end

  def update
    @params = params
    @album = find_one
    @album.name = params[:album][:name]
    @album.artist = params[:album][:artist]
    @album.description = params[:album][:description]
    @album.save
    redirect_to album_path(@album.id)
  end

  def upvote
    @album = find_one
    @album.votes += 1
    @album.save
    redirect_to album_path(@album.id)
  end

  def delete
    @album = find_one
    @album.destroy
    redirect_to albums_path
  end
end

private
def params
  params.require(:album).permit(:name, :artist, :description)
end
