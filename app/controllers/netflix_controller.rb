class NetflixController < ApplicationController

  def findNetflix
    return Netflix.find(params[:id].to_i)
  end

  def upvote
    @netflix = findNetflix
    @netflix.ranking += 1
    @netflix.save
    redirect_to :action => "show"
  end

  def index
    @netflixes = Netflix.all.sort_by {|n| n.ranking}.reverse!
  end

  def show
    @netflix = findNetflix
  end

  def edit
    @netflix = findNetflix

    if @netflix == nil
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def update
    edit

    if @netflix.update(name: params[:netflix][:name], description: params[:netflix][:description], genre: params[:netflix][:genre])
      redirect_to action: "show"
    else
      render 'edit'
    end
  end

  def new
    @netflix = Netflix.new
  end

  def create
    @params = params
    @netflix = Netflix.new
    @netflix.name = params[:netflix][:name]
    @netflix.description = params[:netflix][:description]
    @netflix.genre = params[:netflix][:genre]
    @netflix.ranking = 1

    if (@netflix.save)
     #if item is successfully saved, go to the index
     redirect_to :action => "index"
    else
     #if a validation is failed show the "new" form again
     render :action => :new
    end
  end

  def destroy
    @netflix = findNetflix
    @netflix.destroy

    redirect_to action: "index"
  end
end
