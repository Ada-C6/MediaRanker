class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def find_book
    return Book.find(params[:vendor_id].to_i)
  end

  def show
    @mybook = find_book
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
