class WizardsController < ApplicationController
  def index
    @wizards = Wizard.all.sort_by {|wizard| wizard.wizard_votes.count }.reverse
  end

  def show
    @wizards = Wizard.all
    @wizard = Wizard.find(params[:id].to_i)
  end

  def new
    @wizard = Wizard.new
  end

  def create
    @wizard = Wizard.new
    @wizard.title = params[:wizard][:title]
    @wizard.author_director = params[:wizard][:author_director]
    @wizard.main_character = params[:wizard][:main_character]
    @wizard.save

    redirect_to show_wizard_path(@wizard.id)
  end

  def edit
      @wizard = Wizard.find(params[:id].to_i)
  end

  def update
    @wizard = Wizard.find(params[:id].to_i)
    @wizard.title = params[:wizard][:title]
    @wizard.author_director = params[:wizard][:author_director]
    @wizard.main_character = params[:wizard][:main_character]
    @wizard.save

    redirect_to show_wizard_path(@wizard.id)
  end

  def delete
    @wizard = Wizard.find(params[:id].to_i)
    @wizard.destroy

    redirect_to wizard_path
  end

  def upvote
    @wizard = Wizard.find(params[:id].to_i)
    @wizard.wizard_votes.create
    redirect_to wizard_path
  end

end

private
def params
  params.require(:wizard).permit(:title, :author_director, :main_character)
end
