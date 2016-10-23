class BooksController < ApplicationController
  def index
    @books = Book.all.order('rank desc, id')
  end

  def find_book
    if Book.exists?(params[:id].to_i) == true
      return Book.find(params[:id].to_i)
    else
      render :status => 404
    end
  end

  def show
    @mybook = find_book
  end

  def upvote
    @mybook = find_book
    @mybook.upvote
    redirect_to :back  ##redirects to previous page
  end

  def downvote
    @mybook = find_book
    @mybook.downvote
    redirect_to :back
  end

  def new
    @mybook = Book.new
    @post_method = :post
    @post_path = books_path
  end

  def create
    @params = params
    @mybook = Book.new
    @mybook.title = params[:book][:title]
    @mybook.author = params[:book][:author]
    @mybook.genre = params[:book][:genre]
    @mybook.description = params[:book][:description]
    @mybook.rank = 0

    if @mybook.save
      redirect_to books_path
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :post
      @post_path = books_path
      render :new
    end
  end

  def edit
    @mybook = find_book
    @post_method = :put
    @post_path = book_path(@mybook.id)
  end

  def update
    @params = params
    @mybook = find_book
    @mybook.title = params[:book][:title]
    @mybook.author = params[:book][:author]
    @mybook.genre = params[:book][:genre]
    @mybook.description = params[:book][:description]

    if @mybook.save
      redirect_to book_path(@mybook.id)
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :put
      @post_path = book_path(@mybook.id)
      render :edit
    end
  end

  def destroy
    @mybook = find_book
    if @mybook.class == Book
      @mybook.destroy
      redirect_to books_path
    end
  end
end
