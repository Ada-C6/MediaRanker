class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    # Right now the order of the albums is the order they're in the database. I will need to sort them by their ranking at some point. Woooo, mergesort? maybe here, maybe in the model. Go look at that article we read about how to move things to the model.
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    @album.save
    if @album.save
      redirect_to album_path(@album)
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
      redirect_to album_path(@album)
    else
      render :edit
    end
  end

  def destroy
    Album.find(params[:id]).destroy

    redirect_to albums_path
  end

  def upvote
    @album = Album.find(params[:id])
    @album.rank += 1

    @album.save
    #this stores the current page in the session hash, so that I can then redirect to the same page that this completed action is called from. It also cleans it up by deleting it after it's done.
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end


  private

  def album_params
    params.require(:album).permit(:title, :artist, :description)
  end

end
