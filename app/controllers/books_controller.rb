class BooksController < ApplicationController
  def index
    @books = Book.all_ranked
  end

  def show
    begin
      @book = Book.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(filter_params)

    if @book.save
      redirect_to books_show_path(@book.id)
    else
      render :new, :status => :error
    end

  end

  def edit
    begin
      @book = Book.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def update
    begin
      @book = Book.find(params[:id])

      # Verb patch is used for upvote; verb put is used for full edit

      if request.patch?
        @book.update(upvotes: @book.upvotes + 1)
        if request.referer.include?('show')
          redirect_to books_show_path(@book.id)
        else
          redirect_to books_index_path
        end
      else
        @book.update_attributes(filter_params)

        if @book.save
          redirect_to books_show_path(@book.id)
        else
          @book.restore_attributes
          render :edit, :status => :error
        end
      end
    rescue ActiveRecord::RecordNotFound
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def destroy
    begin
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_index_path
    rescue ActiveRecord::RecordNotFound
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def filter_params
    return params.require(:book).permit(:title, :author, :description)
  end
end
