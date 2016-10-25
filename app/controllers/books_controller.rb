class BooksController < ApplicationController
  def index
    @book = Book.order(rank: :desc)
  end

  def show
    @book = Book.find(params[:id].to_i)
  end

  def new
    @book = Book.new
    @path = books_path
  end

  def create
    @params = params
    @book = Book.new
    @book.title = params[:book][:title]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]
    @book.rank = 0
    @book.save
    redirect_to action: 'index'
  end

  def edit
    @book = Book.find(params[:id].to_i)
    @path = book_path
  end

  def update
    @book = Book.find(params[:id].to_i)
    @book.title = params[:book][:title]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]
    @book.save
    redirect_to action: 'show'
  end

  def upvote
    @book = Book.find(params[:id].to_i)
    @book.rank += 1
    @book.save

    redirect_to :back
  end

  def destroy
    @book = Book.find(params[:id].to_i)
    @book.destroy

    redirect_to books_path
  end
end
