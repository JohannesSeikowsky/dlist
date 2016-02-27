class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # declaring a method as a helper method makes it available for use in the views layer.
  helper_method :return_current_user, :logged_in?

  # defining the current_user method here makes them available in all controllers
  def return_current_user
    @current_user ||= User.find(session[:id_of_current_user]) if session[:id_of_current_user]
  end

  def logged_in?
    if !session[:id_of_current_user].nil?
      true
    else
      false
    end
  end
end