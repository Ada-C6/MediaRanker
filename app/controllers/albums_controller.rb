class AlbumsController < ApplicationController
  def findAlbum
    return Album.find(params[:id].to_i)
  end

  def index
    @albums = Album.all
  end

  def show
    @album = findAlbum
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end
end
