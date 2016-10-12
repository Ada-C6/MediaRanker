class MediaController < ApplicationController
class MediaController < ApplicationController

  
  def find_medium
    return Medium.find(params[:id].to_i)
  end

  def index
    @media = Medium.all.sort_by { |medium| medium.votes.size }.reverse

  end

  def new
    @my_medium = Medium.new
    @post_method = :post
    @post_path = create_medium_path
  end

  def create
    @params = params
    @my_medium.name = params[:medium][:name]
    @my_medium.artist = params[:medium][:artist]
    @my_medium.description = params[:description]
    @my_medium.ranking = 0
    if @my_medium.save
      redirect_to index_media_path
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :post
      @post_path = create_medium_path
      render :new
    end
  end

  def show
    @my_medium = find_medium
  end

  def edit
    @my_medium = find_medium
    @post_method = :put
    @post_path = update_medium_path
  end

  def update
    @params = params
    @my_medium = find_medium

    if @my_medium == nil
        render :file => 'public/404.html',
            :status => :not_found
    end  

    @my_medium.name = params[:medium][:name]
    @my_medium.artist = params[:medium][:artist]
    @my_medium.description = params[:medium][:description]
    @my_medium.ranking = params[:medium][:ranking] 

    if @my_medium.save
      redirect_to index_media_path
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :put
      @post_path = update_medium_path
      render :new
    end    
  end

  def destroy
    @my_medium = find_medium
    if @my_medium != nil
      @my_medium.destroy
      redirect_to index_media_path
    end    
  end

  def upvote
    @my_medium = find_medium
    @my_medium.votes.create
    redirect_to(index_media_path)
  end

  def downvote
    @my_medium = find_medium
    @my_medium.votes.first.destroy
    @my_medium.ranking = @my_medium.votes.count
    redirect_to(index_media_path)
  end
end

