class UsersController < ApplicationController
  def index
    @movies = Movie.order(vote_count: :desc).limit(4)
    @books = Book.order(vote_count: :desc).limit(4)
    @albums = Album.order(vote_count: :desc).limit(4)
  end

  def show

  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
