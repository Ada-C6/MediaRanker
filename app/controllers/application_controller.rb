class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def not_found
    render :file => "#{Rails.root}/public/404", :status => 404
    # render :status => 404
    # raise ActionController::RoutingError.new('Not Found')
    # raise ActiveRecord::RecordNotFound


  end

end
