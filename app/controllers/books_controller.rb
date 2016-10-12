class BooksController < ApplicationController

  def find_n_sort_all
    @books = Book.all
    # @books = Book.all.sort {|a,b| b <=> a}
  end

  def find_one
    return Book.find(params[:id].to_i)
  end

  def index
    find_n_sort_all
  end

  def show
    @book = find_one
  end

  def new
    @book = Book.new
    @path_name = books_path
  end

  def create
    @params = params
    @book = Book.new
    @book.name = params[:book][:name]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]
    @book.votes = 0
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
    show
  end

  def update
    @params = params
    @book = find_one
    @book.name = params[:book][:name]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]
    @book.save
    redirect_to book_path(@book.id)
  end

  def upvote
    @book = find_one
    @book.votes += 1
    @book.save
    redirect_to books_path
  end

  def destroy
    @book = find_one
    @book.destroy
    redirect_to books_path
  end
end

private
def params
  params.require(:book).permit(:name, :author, :description, :votes)
end
