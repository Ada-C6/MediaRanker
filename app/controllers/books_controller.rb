class BooksController < ApplicationController

  def index
    @books = Book.order(:rank).reverse_order
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    @book.save
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    Book.find(params[:id]).destroy

    redirect_to books_path
  end

  def upvote
    @book = Book.find(params[:id])
    @book.rank += 1

    @book.save
    #this stores the current page in the session hash, so that I can then redirect to the same page that this completed action is called from. It also cleans it up by deleting it after it's done.
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end


  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end
