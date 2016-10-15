class BooksController < ApplicationController
  def index
    @book_list = Book.all
  end
end
