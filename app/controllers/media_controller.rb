class MediaController < ApplicationController
  def index
@books = Book.all
@movies = Movie.all
@albums = Album.all
  end

  def show

  end


  def new

  end

  def create
  end

  def edit

  end

  def update

  end



  def delete
  end
end
