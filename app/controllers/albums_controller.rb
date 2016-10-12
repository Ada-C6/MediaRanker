class AlbumsController < ApplicationController
  def index
    @albums = Album.all
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
      redirect_to albums_path
    else
      render :edit
    end

  end

  def delete
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to album_path
  end

  def show
    @album = Album.find(params[:id])
  end

  def upvote
    @album = Album.find(params[:id])
    @album.rank += 1
    @album.save
    redirect_to :back
  end

  private

  def album_params
    params.require(:album).permit(:name, :artist, :description) #do i want :rank ?
  end


end
