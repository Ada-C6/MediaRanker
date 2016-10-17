class MoviesController < ApplicationController

  def index
    @full_list = Movie.all
  end

  def show
    @id = Integer(params[:id])
    @this_item = Movie.find(@id)
    @name = @this_item.name
    @person = @this_item.director
    @description = @this_item.description
    @show = vote_movie_path(@id)
    @edit = edit_movie_path(@id)
    @delete = edit_movie_path(@id)
    @index = movies_path
    @root = root_path
  end

  def new
    @new_item = Movie.new
    @name = :name
    @person = :director
    @description = :description

  end

  def create
    @new_item = Movie.new(movie_params)
    @new_item.rank = 0
    @new_item.save
    redirect_to movies_path
  end

  def edit
    @id = params[:id]
    @this_item = Movie.find(params[:id])
    @name = :name
    @person = :director
    @description = :description

  end

  def update
    @this_item = Movie.find(params[:id])
    if @this_item.update(movie_params)
      redirect_to show_movie_path(params[:id])
    else
      render :edit
    end
  end

  def vote
    id = params[:id]
    this_item = Movie.find(id)
    this_item.rank +=1
    this_item.save
    @voted_item = this_item
    redirect_to movies_path
  end

  def destroy
    @item = Movie.find(params[:id]).destroy
    redirect_to movies_path
  end

end



private

def movie_params
  params.require(:movie).permit(:name, :director, :description)
end
