class MoviesController < ApplicationController
  def index
    @movies = Movie.all_ranked
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(filter_params)

    if @movie.save
      redirect_to movies_show_path(@movie.id)
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    # Verb patch is used for upvote; verb put is used for full edit

    if request.patch?
      @movie.update(upvotes: @movie.upvotes + 1)
      if request.referer.include?('show')
        redirect_to movies_show_path(@movie.id)
      else
        redirect_to movies_index_path
      end
    else
      @movie.update_attributes(filter_params)

      if @movie.save
        redirect_to movies_show_path(@movie.id)
      else
        @movie.restore_attributes
        render :edit
      end
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_index_path
  end

  def filter_params
    return params.require(:movie).permit(:title, :director, :description)
  end

end
