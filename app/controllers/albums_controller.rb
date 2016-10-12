class AlbumsController < ApplicationController
  def index
    @albums_by_rank = Album.order(:rank).reverse
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      # saved successfully
      redirect_to album_path(@album.id)
    else
      # did not save
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      # saved successfully
      redirect_to album_path
    else
      # did not save
      render :edit
    end
  end

  def upvote
    @album = Album.find(params[:id])
    @album.rank += 1
    @album.save

    #redirects back to where the request came from
    redirect_to :back
    # redirect_to album_path(@album.id)
  end

  def destroy
    @album = Album.find(params[:id])

    @album.destroy
    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:name, :artist, :description)
  end
end
