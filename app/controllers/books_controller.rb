class BooksController < ApplicationController
  def index
    @data = Book.order('ranking DESC')
  end

  def show
    @book = Book.find(params[:id])
  end

  def upvote
    @book = show
    @book.ranking += 1
    @book.save

    redirect_to :book
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.ranking = 0
    if @book.save
      #SUCCESS
      redirect_to book_path(@book)
    else
      #NOPE
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = edit
    if @book.update(book_params)
      #SUCCESS
      redirect_to book_path(@book)
    else
      #NOPE
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
