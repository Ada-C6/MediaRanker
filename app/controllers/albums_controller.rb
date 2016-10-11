class AlbumsController < ApplicationController
  def findAlbum
    return Album.find(params[:id].to_i)
  end

  def index
    @albums = Album.all
  end

  def show
    @album = findAlbum
  end

  def edit
    @album = findAlbum

    if @album == nil
          render :file => 'public/404.html',
              :status => :not_found
    end
  end

  def update
    @album = findAlbum

    if @album.update(title: params[:album][:title], recorded_by: params[:album][:recorded_by], description: params[:album][:description])
      redirect_to action: "show"
    else
      render 'edit'
    end
  end

  def new
    @album = Album.new
  end

  def create
    @params = params
    @album = Album.new
    @album.title = params[:album][:title]
    @album.recorded_by = params[:album][:recorded_by]
    @album.description = params[:album][:description]

    if(@album.save)
      #saved successfully; go to index
      redirect_to :action => "index"
    else
      #validation failed; show the "new" form again
      render :action => :new
    end
  end

  def destroy
    @album = findAlbum
    @album.destroy

    redirect_to action: "index"
  end

  def upvote
    @album = findAlbum

    session[:voting_id] ||= create_unique_voting_id
    voter = VotingSession.find_or_create_by_unique_voting_id(session[:voting_id])

    @album.upvote_by voter
    
    redirect_to action: "show"
  end
end
