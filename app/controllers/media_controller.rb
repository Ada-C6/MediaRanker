class MediaController < ApplicationController

  
  # def Medium.find params[:id]
  #   begin
  #     @my_medium = Medium.find params[:id]
  #   rescue ActiveRecord::RecordNotFound => e
  #     @my_medium = nil
  #   end
  #   return @my_medium
  # end

  def index

    @albums = Medium.where(kind: 'album').sort_by { |medium| medium.votes.size }.reverse

    @books = Medium.where(kind: 'book').sort_by { |medium| medium.votes.size }.reverse

    @movies = Medium.where(kind: 'movie').sort_by { |medium| medium.votes.size }.reverse

  end

  def new
    @my_medium = Medium.new
    @post_method = :post
    @post_path = create_media_path
  end

  def create
    @params = params
    @my_medium = Medium.new
    @my_medium.title = params[:medium][:title]
    @my_medium.maker = params[:medium][:maker]
    @my_medium.description = params[:description]
    if @my_medium.save
      redirect_to index_media_path
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :post
      @post_path = create_media_path
      render :new
    end
  end

  def show
    @my_medium = Medium.find(params[:id])
      if @my_medium == nil
      render :file => 'public/404.html',
          :status => :not_found
    end  
  end

  def edit
    @my_medium = Medium.find(params[:id])
    @post_method = :put
    @post_path = update_media_path
  end

  def update
    @params = params
    @my_medium = Medium.find(params[:id])

    # if @my_medium == nil
    #     render :file => 'public/404.html',
    #         :status => :not_found
    # end  

    @my_medium.title = params[:title]
    @my_medium.maker = params[:maker]
    @my_medium.description = params[:description]

    if @my_medium.save
      redirect_to index_media_path
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :put
      @post_path = update_media_path
      render :new
    end    
  end

  def destroy
    @my_medium = Medium.find(params[:id])
    if @my_medium != nil
      @my_medium.destroy
      redirect_to index_media_path
    end    
  end

  def upvote
    @my_medium = Medium.find(params[:id])
    @my_medium.votes.create
    redirect_to(index_media_path)
  end

  def downvote
    @my_medium = Medium.find(params[:id])
    if @my_medium.votes.count >= 1
      @my_medium.votes.first.destroy
    else
      return "It's already at '0'. You can't downvote it further."
    end
    redirect_to(index_media_path)
  end
end

