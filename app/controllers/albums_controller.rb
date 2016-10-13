class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.rank = 0
    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_path(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id]).destroy

    redirect_to movies_path
  end

  private

  def album_params
    params.require(:album).permit(:title, :artist, :description)
  end
end
