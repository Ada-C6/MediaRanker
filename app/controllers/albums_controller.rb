class AlbumsController < ApplicationController

  def index
    @albums = Album.all.order(:ranking).reverse
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      #SUCCESS
      redirect_to albums_path
    else
      #UNSUCCESSFUL
      render :new
    end
  end

  def update
    @album = Album.find(params[:id])
        if @album.update(album_params)
          # SUCCESS
          redirect_to album_path
        else
          # UNSUCCESSFUL
          render :edit
        end
  end

  def destroy
    Album.find(params[:id]).destroy
    redirect_to albums_path
  end

  def upvote
    @album = Album.find(params[:id])
    @album.increment!(:ranking)
    redirect_to album_path
  end

  private

  def album_params
    params.require(:album).permit(:name, :artist, :description)
  end

end
