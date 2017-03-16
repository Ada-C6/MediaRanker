class MoviesController < ApplicationController
  def index
    @movies = Movie.all_ranked
  end

  def show
    begin
      @movie = Movie.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def new
    @movie = Movie.new
    @path = movies_create_path
    @method = :post
  end

  def create
    @movie = Movie.new(filter_params)

    if @movie.save
      redirect_to movies_show_path(@movie.id)
    else
      @path = movies_create_path  # To be able to render the new form correctly
      @method = :post # To be able to render the new form correctly
      render :new, :status => :error
    end

  end

  def edit
    begin
      @movie = Movie.find(params[:id])
      @path = movies_update_path
      @method = :put
    rescue ActiveRecord::RecordNotFound
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def update
    begin
      @movie = Movie.find(params[:id])

      # Verb patch is used for upvote; verb put is used for full edit

      if request.patch?
        @movie.update(upvotes: @movie.upvotes + 1)
        if request.referer && request.referer.include?('show') # A nil referer will fall through to the else (index path)
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
          @path = movies_update_path  # To be able to render edit form correctly
          @method = :put  # To be able to render edit form correctly
          render :edit, :status => :error
        end
      end
    rescue ActiveRecord::RecordNotFound
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def destroy
    begin
      @movie = Movie.find(params[:id])
      @movie.destroy
      redirect_to movies_index_path
    rescue ActiveRecord::RecordNotFound
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def filter_params
    return params.require(:movie).permit(:title, :director, :description)
  end

end
