class BooksController < ApplicationController


  def index
    @books = Book.all
  end

  def show
    @mybook = Book.find(params[:id])
  end

  def new
    @mybook = Book.new
    @book_method = :post
    @book_path = books_path
  end

  def create
    @mybook = Book.new
    @mybook.title = params[:book][:title]
    @mybook.creator = params[:book][:creator]
    @mybook.description = params[:book][:description]
    @mybook.rank = params[:book][:rank]
    @mybook.save
    redirect_to books_path
  end

  def edit
    @mybook = Book.find(params[:id].to_i)
    @book_method = :put
    @books_path = edit_book_path(@mybook.id)
    if @mybook == nil
          render :file => 'public/404.html',
              :status => :not_found
    end
  end

  def update
    @mybook = Book.find(params[:id])
    if @mybook == nil
      render :file => 'public/404.html', :status => :not_found
    end
    @mybook.title = params[:book][:title]
    @mybook.creator = params[:book][:creator]
    @mybook.description = params[:book][:description]
    @mybook.rank = params[:book][:rank]
    @mybook.save
    redirect_to book_path(@mybook.id)
  end



  def destroy
    @mybook = Book.find(params[:id])
    @mybook.destroy
    redirect_to books_path
  end
end
