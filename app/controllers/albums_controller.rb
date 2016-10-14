class AlbumsController < ApplicationController
  def index
    @albums = Album.order(upvotes: :desc)
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    # media starts out with zero and not nill upvotes.
    @album.upvotes = 0

    if @album.save
      redirect_to album_path(@album)
    else
      render :new

    end
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

  def upvote
    @album = Album.find(params[:id])
    @album.upvote

    redirect_to album_path(@album)
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:name, :artist, :description)
  end
end
