class BooksController < ApplicationController
  def findBook
    return Book.find(params[:id].to_i)
  end

  def index
    @books = Book.all
  end

  def show
    @book = findBook
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end
end
