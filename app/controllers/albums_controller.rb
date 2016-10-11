class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_path
    else
      render :new
    end
  end

  def edit  # Will give the form, like new
    @album = Album.find(params[:id])
  end

  def update # Actually do the update, like create
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_path
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id]).destroy
    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:name, :artist, :description)
  end
end
