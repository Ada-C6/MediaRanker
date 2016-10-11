class BooksController < ApplicationController

  def show
    id = Integer(params[:id])
    @this_book = Book.find(id)

  end
end
