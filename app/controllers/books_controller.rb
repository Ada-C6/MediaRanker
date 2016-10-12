class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @mybook = Book.new
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
