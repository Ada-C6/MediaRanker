class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def upvote
  end
end

# def index
#   @tasks = Task.all
# end
#
# def show
#   @mytask = Task.find(params[:id].to_i)
# end
#
# def new
#   @path = "create_path"
#
#   @mytask = Task.new
# end
#
# def create
#   @mytask = Task.new
#   @mytask.title = params[:task][:title]
#   @mytask.description = params[:task][:description]
#   @mytask.completed = false
#   @mytask.save
#
#   # For better user experience, users are redirected home after action
#   redirect_to action: 'index'
# end
#
# def edit
#   @path = "update_path"
#   @mytask = Task.find(params[:id])
# end
#
# def update
#   @mytask = Task.find(params[:id])
#   @mytask.title = params[:task][:title]
#   @mytask.description = params[:task][:description]
#   @mytask.completed = params[:task][:completed]
#
#   # If a task is marked as completed, completed_at is updated to the current Date & Time
#   if @mytask.completed == true
#     @mytask.completed_at = DateTime.now
#   end
#
#   @mytask.save
#
#   redirect_to action: 'index'
# end
#
# def destroy
#   Task.find(params[:id]).destroy
#
#   redirect_to action: 'index'
# end
