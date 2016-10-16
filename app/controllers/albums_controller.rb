class AlbumsController < ApplicationController
  def index
    @albums = Album.all.order(:ranked).reverse
  end

  def show
    begin
      @album = Album.find(params[:id])
    rescue ActiveRecord::RecordNotFound => err
      render "/errors/not_found", status: :not_found
    end
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_path
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
      redirect_to album_path(@album.id)
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
    @album.upvote
    @album.save

    redirect_to album_path(@album.id)
  end

  private

  def album_params
    params.require(:album).permit(:name, :artist, :description, :ranked)
  end
end
