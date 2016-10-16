class AlbumsController < ApplicationController
  def index
    @data = Album.order('ranking DESC')
  end

  def show
    @album = Album.find(params[:id])
  end

  def upvote
    @album = show
    @album.ranking += 1
    @album.save

    redirect_to :album
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.ranking = 0
    if @album.save
      #SUCCESS
      redirect_to album_path(@album)
    else
      #NOPE
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = edit
    if @album.update(album_params)
      #SUCCESS
      redirect_to album_path(@album)
    else
      #NOPE
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
