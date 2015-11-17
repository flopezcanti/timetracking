class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_404(params)
  	Rails.logger.warn("tried to access #{params} which did not exits")
  	render 'layouts/404'
  end
end
