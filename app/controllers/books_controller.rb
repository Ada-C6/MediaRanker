class BooksController < ApplicationController

  before_action :find_book, except: [:new, :create, :index]

  def index
    @books = Book.all
  end

  def show

  end

  def new
    @mybook = Book.new

  end

  def create
    @mybook = Book.new
    @mybook.title = params[:book][:title]
    @mybook.creator = params[:book][:creator]
    @mybook.description = params[:book][:description]
    @mybook.save
    redirect_to books_path
  end

  def edit

    @book_method = :put
    @book_path = edit_book_path(@mybook.id)
    if @mybook == nil
          render :file => 'public/404.html',
              :status => :not_found
    end
  end

  def update

    if @mybook == nil
      render :file => 'public/404.html', :status => :not_found
    end
    @mybook.title = params[:book][:title]
    @mybook.creator = params[:book][:creator]
    @mybook.description = params[:book][:description]
    @mybook.save
    redirect_to book_path(@mybook.id)
  end



  def destroy

    @mybook.destroy
    redirect_to books_path
  end

  def upvote

    @mybook.upvote
    redirect_to books_path
  end

  private

  def find_book
    @mybook = Book.find(params[:id])
  end

end#end of class
