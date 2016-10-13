class BobsController < ApplicationController
  def index
    @bobs = Bob.all.sort_by {|bob| bob.bob_votes.count }.reverse
  end

  def show
    @bobs = Bob.all
    @bob = Bob.find(params[:id].to_i)
  end

  def new
    @bob = Bob.new
  end

  def create
    @bob = Bob.new
    @bob.name = params[:bob][:name]
    @bob.appears_in = params[:bob][:appears_in]
    @bob.identifying_quality = params[:bob][:identifying_quality]
    @bob.save

    redirect_to show_bob_path(@bob.id)
  end

  def edit
      @bob = Bob.find(params[:id].to_i)
  end

  def update
    @bob = Bob.find(params[:id].to_i)
    @bob.name = params[:bob][:name]
    @bob.appears_in = params[:bob][:appears_in]
    @bob.identifying_quality = params[:bob][:identifying_quality]
    @bob.save

    redirect_to show_bob_path(@bob.id)
  end

  def delete
    @bob = Bob.find(params[:id].to_i)
    @bob.destroy

    redirect_to bob_path
  end

  def upvote
    @bob = Bob.find(params[:id].to_i)
    @bob.bob_votes.create
    redirect_to bob_path
  end

end

private
def params
  params.require(:bob).permit(:name, :appears_in, :identifying_quality)
end
