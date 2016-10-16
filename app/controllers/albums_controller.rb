class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    begin
      @album = Album.find(params[:id])
    rescue ActiveRecord::RecordNotFound => err
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
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
      redirect_to album_path
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
    Album.increment_counter(:rank, @album)
    redirect_to album_path(@album)
  end


# ---- PRIVATE METHODS ----

  private

  def album_params
    params.require(:album).permit(:name, :artist, :description, :rank)
  end
end
