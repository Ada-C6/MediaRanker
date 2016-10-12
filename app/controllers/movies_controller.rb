class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = findMovie
  end

  def edit
    @movie = findMovie

    if @movie == nil
          render :file => 'public/404.html',
              :status => :not_found
    end
  end

  def update
    @movie = findMovie

    if @movie.update(name: params[:movie][:name], directed_by: params[:movie][:directed_by], description: params[:movie][:description])
      redirect_to action: "show"
    else
      render 'edit'
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @params = params
    @movie = Movie.new
    @movie.name = params[:movie][:name]
    @movie.directed_by = params[:movie][:directed_by]
    @movie.description = params[:movie][:description]

    if(@movie.save)
      #saved successfully; go to index
      redirect_to :action => "index"
    else
      #validation failed; show the "new" form again
      render :action => :new
    end
  end

  def destroy
    @movie = findMovie
    @movie.destroy

    redirect_to action: "index"
  end

  def upvote
    Movie.increment_counter(:ranked, params[:id])
    redirect_to action: "show"
  end

  private
  def findMovie
    return Movie.find(params[:id].to_i)
  end
end
