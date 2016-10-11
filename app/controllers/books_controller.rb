class BooksController < ApplicationController
  def index
    @books = Book.all.order(rank: :desc)
  end

  def find_book
    return Book.find(params[:id].to_i)
  end

  def show
    @mybook = find_book
  end

  def upvote
    @mybook = find_book
    @mybook.rank += 1
    @mybook.save
    render :show
  end

  def downvote
    @mybook = find_book
    @mybook.rank -= 1
    @mybook.save
    render :show
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
      render :new_book
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
    # @mybook.rank

    if @mybook.save
      redirect_to book_path(@mybook.id)
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :put
      @post_path = book_path(@mybook.id)
      render :edit_book
    end
  end

  def destroy
    @mybook = find_book
    if @mybook != nil
      @mybook.destroy
      redirect_to books_path
    end
  end
end
