class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def create
    @album = Album.new(album_params)
    @album.ranking = 0
    @album.save
    redirect_to albums_path
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
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

####### STRONG PARAMS ##############
  private
  def album_params
    params.require(:album).permit(:id, :name, :artist, :description, :ranking)
  end
end
