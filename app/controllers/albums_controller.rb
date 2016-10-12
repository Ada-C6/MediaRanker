class AlbumsController < ApplicationController
  def index
    @albums = Album.all.order(:ranked).reverse
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
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
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to albums_path
  end

  def upvote
    @album = Album.find(params[:id])
    @album.ranked += 1
    @album.save

    redirect_to album_path(@album.id)
  end

  private

  def album_params
    params.require(:album).permit(:title, :recorded_by, :description)
  end
end
