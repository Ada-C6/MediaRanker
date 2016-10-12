class AlbumsController < ApplicationController

  def index
    @albums = Album.all.order(:upvotes).reverse
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.upvotes = 0
    if @album.save
      redirect_to album_path(@album)
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

  def vote
    @album = Album.find(params[:id])
    @album.increment!(:upvotes)
    redirect_to album_path
  end

  private

  def album_params
    params.require(:album).permit(:name, :artist, :description)
  end
end
