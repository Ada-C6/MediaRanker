class BooksController < ApplicationController

  def index
    @full_list = Book.all
  end

  def show
    @id = Integer(params[:id])
    @this_item = Book.find(@id)
  end

  def new
    @new_item = Book.new

  end

  def create
    @new_item = Book.new(book_params)
    @new_item.rank = 0
    @new_item.save
    redirect_to books_path
  end

  def edit
    @id = params[:id]
    @this_item = Book.find(params[:id])

  end

  def update
    @this_item = Book.find(params[:id])
    if @this_item.update(book_params)
      redirect_to show_book_path(params[:id])
    else
      render :edit
    end
  end

  def vote
    id = params[:id]
    this_item = Book.find(id)
    this_item.rank +=1
    this_item.save
    redirect_to books_path

  end

  def destroy
    @item = Book.find(params[:id]).destroy
    redirect_to books_path
  end




  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end

end
