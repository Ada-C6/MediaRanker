class AlbumsController < ApplicationController

  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
  @albums = Album.rank
  end

  def show;end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_path(@album.id)
    else
      render :new
    end
  end

  def edit;end

  def update
    if @album.update(album_params)
      redirect_to album_path
    else
      render :edit
    end
  end

    def upvote
      @album = Album.find(params[:album_id])
      Album.upvote(@album)
      redirect_to album_path(@album)
    end

  def destroy
    @album.destroy

    redirect_to albums_path
  end

  private
  def album_params
      params.require(:album).permit(:name, :artist, :description)
    end

    def find_params
      @album = Album.find(params[:id])
    end
end
