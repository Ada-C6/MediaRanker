class AlbumsController < ApplicationController

  def index
    @albums = Album.order('num_votes DESC, id')
  end

  def show
    find
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new

    @album.title = params[:album][:title]
    @album.num_votes = 0
    @album.artist = params[:album][:artist]
    @album.description = params[:album][:description]

    @album.save

    if @album.save
      redirect_to album_path(@album.id)
    else
      redirect_to new_album_path
    end
  end

  def upvote
    find

    # @album.num_votes += 1
    # @album.save

    @album.upvote

    redirect_to :back
  end

  def edit
    find
  end

  def update
    find

    @album.title = params[:album][:title]
    @album.artist = params[:album][:artist]
    @album.description = params[:album][:description]

    @album.save

    redirect_to album_path(@album.id)
  end

  def destroy
    find

    if @album.class == Album
      @album.destroy
      redirect_to albums_path
    end

  end

  private
  def find
    if Album.exists?(params[:id].to_i)
      @album = Album.find(params[:id].to_i)
    else
      render status: 404
    end
  end

end
