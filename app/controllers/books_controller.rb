class BooksController < ApplicationController
  def index
    @items = Book.order('votes DESC')
  end

  def show
    if Book.exists?(params[:id])
      book = Book.find(params[:id])
      @name = book.name
      @votes = book.votes
      @creator = book.creator
      @description = book.description
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end

  def edit
    if Book.exists?(params[:id])
      @object = Book.find(params[:id])
      @method = :put
      @path = books_update_path(@object)
      @form_name = "Edit"
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end

  def update
    if Book.exists?(params[:id])
      object = Book.find(params[:id])
      object.update(name: params[:book][:name],
                    creator: params[:book][:creator],
                    description: params[:book][:description])
      redirect_to books_show_path(object.id)
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end

  def new
    @object = Book.new
    @method = :post
    @path = books_create_path(@object)
    @form_name = "New"
  end

  def create
      object = Book.new(name: params[:book][:name],
                    creator: params[:book][:creator],
                    description: params[:book][:description],
                    votes: 0)
      object.save
      redirect_to books_show_path(object.id)    
  end

  def destroy
    if Book.exists?(params[:id])
      object = Book.find(params[:id])
      object.destroy
      redirect_to books_index_path
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end

  def upvote
    if Book.exists?(params[:id])
      book = Book.find(params[:id])
      book.votes += 1
      book.save
      redirect_to books_show_path
    else
      raise(ArgumentError, "Please use a correct id.")
    end
  end
end
