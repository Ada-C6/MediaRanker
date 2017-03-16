class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @book_method = :post
    @book_path = "/books"
  end

  def create
    @book = Book.new
    @book.name = params[:book][:name]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]
    @book.rank = 0
    if @book.save
      redirect_to book_path(@book.id)
    else
      redirect_to new_book_path
    end
  end

  def edit
    @book = Book.find(params[:id])
    @book_method = :put
    @book_path = book_path
  end

  def update
    Book.update(params[:id], :name => params[:book][:name],
                              :author => params[:book][:author],
                              :description => params[:book][:description])
    redirect_to book_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def upvote
    @book = Book.find(params[:id])
    @book.upvote
    redirect_to book_path
  end
end
