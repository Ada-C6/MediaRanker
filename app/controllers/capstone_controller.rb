class CapstoneController < ApplicationController

  def findCapstone
    return Capstone.find(params[:id].to_i)
  end

  def upvote
    @capstone = findCapstone
    @capstone.ranking += 1
    @capstone.save
    redirect_to :action => "show"
  end

  def index
    @capstones = Capstone.all.sort_by {|c| c.ranking}.reverse!
  end

  def show
    @capstone = findCapstone
  end

  def edit
    @capstone = findCapstone

    if @capstone == nil
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def update
    edit

    if @capstone.update(name: params[:capstone][:name], description: params[:capstone][:description])
      redirect_to action: "show"
    else
      render 'edit'
    end
  end

  def new
    @capstone = Capstone.new
  end

  def create
    @params = params
    @capstone = Capstone.new
    @capstone.name = params[:capstone][:name]
    @capstone.description = params[:capstone][:description]
    @capstone.ranking = 1

    if (@capstone.save)
     #if item is successfully saved, go to the index
     redirect_to :action => "index"
    else
     #if a validation is failed show the "new" form again
     render :action => :new
    end
  end

  def destroy
    @capstone = findCapstone
    @capstone.destroy

    redirect_to action: "index"
  end
end
