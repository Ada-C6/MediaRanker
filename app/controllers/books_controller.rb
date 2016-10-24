class BooksController < ApplicationController
  def index
    @books_by_rank = Book.order(:rank).reverse
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
      # saved successfully
      redirect_to book_path(@book.id)
    else
      # did not save
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      # saved successfully
      redirect_to book_path
    else
      # did not save
      render :edit
    end
  end

  def upvote
    @book = Book.find(params[:id])
    @book.rank += 1
    @book.save

    redirect_to :back
  end

  def destroy
    @book = Book.find(params[:id])

    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :description, :rank)
  end

end
