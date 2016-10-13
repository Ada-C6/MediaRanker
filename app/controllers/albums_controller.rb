class AlbumsController < ApplicationController
  def index
    @album = Album.all.order(:rank).reverse
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      @album.save
      redirect_to album_path
    else
      render :edit
    end
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  def upvote
    @album = Album.find(params[:id])
    @album.rank += 1
    @album.save
    redirect_to albums_path
  end

  def destroy
    Album.find(params[:id]).destroy
    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:title, :artist, :best_song, :description)
  end
end
