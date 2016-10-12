class AlbumsController < ApplicationController
  def index
    @albums = Album.all_ranked
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(filter_params)

    if @album.save
      redirect_to albums_show_path(@album.id)
    else
      render :new
    end

  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    # Verb patch is used for upvote; verb put is used for full edit

    if request.patch?
      @album.update(upvotes: @album.upvotes + 1)
      if request.referer.include?('show')
        redirect_to albums_show_path(@album.id)
      else
        redirect_to albums_index_path
      end
    else
      @album.update_attributes(filter_params)

      if @album.save
        redirect_to albums_show_path(@album.id)
      else
        @album.restore_attributes
        render :edit
      end
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_index_path
  end

  def filter_params
    return params.require(:album).permit(:title, :artist, :description)
  end
end
