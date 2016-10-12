class AlbumsController < ApplicationController
  def index
    @all_albums = Album.all
    @all_albums = @all_albums.order(:ranking).reverse
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
      render edit_album_path
    end
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

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  def upvote
    @album = Album.find(params[:id])
    if @album.ranking == nil #from when I had nil values for ranking
      @album.ranking = 0
      @album.ranking += 1
      @album.save
    else
    @album.ranking += 1
    @album.save
    end
    redirect_to album_path(@album)
  end

  private
  def album_params
    params.require(:album).permit(:name, :artist, :description)
  end
end
