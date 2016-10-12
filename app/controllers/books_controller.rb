class BooksController < ApplicationController

  def find_n_sort_all
    # @movies = Movie.all.sort {|a,b| b <=> a}
    @books = Book.all.sort {|a,b| b <=> a}
    # @albums = Album.all.sort {|a,b| b <=> a}
  end

  def find_one
    return Album.find(params[:id].to_i)
  end

  def index
    find_n_sort_all
  end

  def show
    find_n_sort_all
    @movie = find_one
  end

  def new
    @book = Book.new
  end

  def create
    @params = params
    @book = Book.new
    @book.name = params[:book][:name]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]
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
    redirect_to album_path(@book.id)
  end

  def delete
    @book = find_one
    @book.destroy
    redirect_to books_path
  end
end

private
def params
  params.require(:book).permit(:name, :author, :description)
end
