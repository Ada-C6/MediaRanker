class AlbumsController < ApplicationController
  def index
    @items = Album.order('votes DESC')
  end

  def show
    if Album.exists?(params[:id])
      album = Album.find(params[:id])
      @name = album.name
      @votes = album.votes
      @creator = album.creator
      @description = album.description
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end

  def edit
    if Album.exists?(params[:id])
      @object = Album.find(params[:id])
      @method = :put
      @path = albums_update_path(@object)
      @form_name = "Edit"
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end

  def update
    if Album.exists?(params[:id])
      object = Album.find(params[:id])
      object.update(name: params[:album][:name],
                    creator: params[:album][:creator],
                    description: params[:album][:description])
      redirect_to albums_show_path(object.id)
    else
      raise(ArgumentError, "Please use a correct id.")
    end

  end

  def new
    @object = Album.new
    @method = :post
    @path = albums_create_path(@object)
    @form_name = "New"
  end

  def create
      object = Album.new(name: params[:album][:name],
                    creator: params[:album][:creator],
                    description: params[:album][:description],
                    votes: 0)
      object.save
      redirect_to albums_show_path(object.id)
  end

  def destroy
    if Album.exists?(params[:id])
      object = Album.find(params[:id])
      object.destroy
      redirect_to albums_index_path
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end

  def upvote
    if Album.exists?(params[:id])
      album = Album.find(params[:id])
      album.votes += 1
      album.save
      redirect_to albums_show_path
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end
end
