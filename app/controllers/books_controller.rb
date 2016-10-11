class BooksController < ApplicationController
  def index
    @books = Book.all.order(:upvotes).reverse
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit  # Will give the form, like new
    @book = Book.find(params[:id])
  end

  def update # Actually do the update, like create
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id]).destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end
end
