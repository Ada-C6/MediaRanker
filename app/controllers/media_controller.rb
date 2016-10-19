class MediaController < ApplicationController

  def votes
    @medium = Medium.find(params[:id])
    @medium.upvote
    @medium.save
    redirect_to(media_path)
  end

  def index
    @media = Medium.where(media_type: params[:media_type])
  end

  def new
    @medium = Medium.new(media_type: params[:media_type])
  end

  def show
    @medium = Medium.find(params[:id])
    @medium.save
  end

  def create
    @medium = Medium.create(medium_params) do |medium|
      medium.media_type = params[:media_type]
    end
    if @medium.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @medium = Medium.find(params[:id]).destroy
    redirect_to media_path
  end

  def edit
     @medium = Medium.find(params[:id])
  end

  def update
    @medium = Medium.find(params[:id])
    if @medium.update(medium_params)
      redirect_to medium_path(id: params[:id])
    else
      render :edit
    end
  end


  private

  def medium_params
    params.require(:medium).permit(:name, :creator, :description)
  end
end
