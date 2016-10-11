class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
  end

  def new
    @newalbum = Album.new
  end

  def create
    @newalbum = Album.new

    @newalbum.title = params[:album][:title]
    @newalbum.artist = params[:album][:artist]
    @newalbum.description = params[:album][:description]
    @newalbum.rank = 0

    @newalbum.save

    redirect_to action: 'index'
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def upvote
  end
end
