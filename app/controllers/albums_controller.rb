class AlbumsController < ApplicationController

  def index
    @full_list = Album.all
  end

  def show
    @id = Integer(params[:id])
    @this_item = Album.find(@id)
    @name = @this_item.name
    @person = @this_item.artist
    @description = @this_item.description
    @show = vote_album_path(@id)
    @edit = edit_album_path(@id)
    @delete = edit_album_path(@id)
    @index = albums_path
    @root = root_path
  end

  def new
    @new_item = Album.new
    @name = :name
    @person = :artist
    @description = :description

  end

  def create
    @new_item = Album.new(album_params)
    @new_item.rank = 0
    @new_item.save
    redirect_to albums_path
  end

  def edit
    @id = params[:id]
    @this_item = Album.find(params[:id])
    @name = :name
    @person = :artist
    @description = :description

  end

  def update
    @this_item = Album.find(params[:id])
    if @this_item.update(album_params)
      redirect_to show_album_path(params[:id])
    else
      render :edit
    end
  end

  def vote
    id = params[:id]
    this_item = Album.find(id)
    this_item.rank +=1
    this_item.save
    redirect_to albums_path

  end

  def destroy
    @item = Album.find(params[:id]).destroy
    redirect_to albums_path
  end

end



private

def album_params
  params.require(:album).permit(:name, :artist, :description)
end
