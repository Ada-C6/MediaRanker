class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    # This code serves as a catch-all for record not found errors in all controllers
    # The user will be redirected to a 404 page and an HTTP status code of 404 will be returned.
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404

    def render_404
      render :file => "#{Rails.root}/public/404", :status => 404
    end
end
