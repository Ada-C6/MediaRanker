class MoviesController < ApplicationController
  def index
    @items = Movie.order('votes DESC')
  end

  def show
    if Movie.exists?(params[:id])
      movie = Movie.find(params[:id])
      @name = movie.name
      @votes = movie.votes
      @creator = movie.creator
      @description = movie.description
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end

  def edit
    if Movie.exists?(params[:id])
        @object = Movie.find(params[:id])
        @method = :put
        @path = movies_update_path(@object)
        @form_name = "Edit"
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end

  def update
    if Movie.exists?(params[:id])
      object = Movie.find(params[:id])
      object.update(name: params[:movie][:name],
                    creator: params[:movie][:creator],
                    description: params[:movie][:description])
      redirect_to movies_show_path(object.id)
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end

  def new
    @object = Movie.new
    @method = :post
    @path = movies_create_path(@object)
    @form_name = "New"
  end

  def create
      object = Movie.new(name: params[:movie][:name],
                    creator: params[:movie][:creator],
                    description: params[:movie][:description],
                    votes: 0)
      object.save
      redirect_to movies_show_path(object.id)
  end

  def destroy
    if Movie.exists?(params[:id])
      object = Movie.find(params[:id])
      object.destroy
      redirect_to movies_index_path
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end

  def upvote
    if Movie.exists?(params[:id])
      movie = Movie.find(params[:id])
      movie.votes += 1
      movie.save
      redirect_to movies_show_path
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end
end
