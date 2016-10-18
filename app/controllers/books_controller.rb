class BooksController < ApplicationController
  def index
    @books = Book.all.order(:ranking).reverse
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      #SUCCESS
      redirect_to books_path
    else
      #UNSUCCESSFUL
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])
        if @book.update(book_params)
          # SUCCESS
          redirect_to book_path
        else
          # UNSUCCESSFUL
          render :edit
        end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path
  end

  def upvote
    @book = Book.find(params[:id])
    @book.increment!(:ranking)
    redirect_to book_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end

end
