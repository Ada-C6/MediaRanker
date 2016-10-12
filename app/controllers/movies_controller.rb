class MoviesController < ApplicationController

  def index
    @full_list = Movie.all
  end

  def show
    @id = Integer(params[:id])
    @this_item = Movie.find(@id)
  end

  def new
    @new_item = Movie.new

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
