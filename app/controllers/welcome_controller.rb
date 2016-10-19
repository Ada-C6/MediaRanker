class WelcomeController < ApplicationController
  def index
    @welcome = Medium.where(media_type: params[:media_type])
    @welcome.order('votes DESC').first(5)
  end
end
