class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @mybook = Book.new
    @book_method = :post
    @book_path = books_path
  end

  def show
    @mybook = Book.find(params[:id])
    if @mybook == nil
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def create
    @mybook = Book.new
    @mybook.name = params[:book][:name]
    @mybook.author = params[:book][:author]
    @mybook.description = params[:book][:description]
    @mybook.save
    redirect_to users_path(@mybook.id)
  end

  def update
    @mybook = Book.find(params[:id])
    if @mybook == nil
      render :file => 'public/404.html', :status => :not_found
    end
    @mybook.name = params[:book][:name]
    @mybook.author = params[:book][:author]
    @mybook.description = params[:book][:description]
    @mybook.save
    redirect_to users_path(@mybook.id)
  end

  def edit
    @mybook = Book.find(params[:id])
    @book_method = :put
    @books_path = book_path
    if @mybook == nil
      render :file => 'public/404.html',
      :status => :not_found
    end
  end

  def destroy
    @mybook = Book.find(params[:id])
    @mybook.destroy
    redirect_to users_path(@mybook.id)
  end

  def upvote
    @mybook = Book.find(params[:id])
    @mybook.vote_count += 1
    @mybook.save
    redirect_to :back
  end

end
