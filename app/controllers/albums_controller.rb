class AlbumsController < ApplicationController
  def album
    @album ||= Album.find(params[:id].to_i)
  end

  def index
    @albums = Album.order(:votes).reverse_order
  end

  def show
    album
  end

  def edit
    album
  end

  def update
    album.update_attributes(album_params)
    redirect_to album_path
  end

  def new
    @album = Album.new
  end

  def destroy
    if Album.exists?(params[:id].to_i)
    album.destroy
    redirect_to :albums
    else
      flash[:notice] = "That album does not exist."
      redirect_to :albums
    end
  end

  def create
    @album = Album.new(name:params[:album][:name],
                     artist:params[:album][:artist],
                     description:params[:album][:description],
                     votes: 0)
   @album.save
   redirect_to :albums
  end

  def up_vote
    album.update_attribute(:votes, (album.votes + 1))
    redirect_to(request.referer)
  end
private
  def album_params
    params.require(:album).permit( :name, :artist, :description, :votes)
  end
end
