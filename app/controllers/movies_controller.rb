class MoviesController < ApplicationController

before_action :find_movie, except: [:new, :create, :index]

def index
  @movies = Movie.all
end

def show

end

def new
  @mymovie = Movie.new

end

def create
  @mymovie = Movie.new
  @mymovie.title = params[:movie][:title]
  @mymovie.creator = params[:movie][:creator]
  @mymovie.description = params[:movie][:description]
  @mymovie.save
  redirect_to movies_path
end

def edit


  if @mymovie == nil
        render :file => 'public/404.html',
            :status => :not_found
  end
end

def update

  if @mymovie == nil
    render :file => 'public/404.html', :status => :not_found
  end

  @mymovie.title = params[:movie][:title]
  @mymovie.creator = params[:movie][:creator]
  @mymovie.description = params[:movie][:description]
  @mymovie.save
  redirect_to movie_path(@mymovie.id)
end



def destroy
@mymovie.destroy
  redirect_to movies_path
end

def upvote
@mymovie.upvote
  redirect_to movies_path
end

private

def find_movie
  @mymovie = Movie.find(params[:id])
end

end#end of class
