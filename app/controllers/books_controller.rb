class BooksController < ApplicationController
  def index
    @books = Book.all_ranked
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(filter_params)

    if @book.save
          redirect_to books_show_path(@book.id)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    # Verb patch is used for upvote; verb put is used for full edit

    if request.patch?
      book.update(upvotes: book.upvotes + 1)
      if request.referer.include?('show')
        redirect_to books_show_path(book.id)
      else
        redirect_to books_index_path
      end
    else
      @book.update_attributes(filter_params)

      if @book.save
        redirect_to books_show_path(@book.id)
      else
        @book.restore_attributes
        render :edit
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_index_path
  end

  def filter_params
    return params.require(:book).permit(:title, :author, :description)
  end
end
