class UserSessionsController < ApplicationController
  def new
  end

  def create
    # authentication the persons thats trying to sign in.
    user = User.find_by_email(params[:provided_parameters][:email])
    if user && user.user_authentication(params[:provided_parameters][:password])
      # log in
      session[:id_of_current_user] = user.id
      redirect_to new_user_done_path(user), notice: "You have logged in."
    else
      # don't log in
      flash.now.notice = "Parameters insufficient. Try again."
      render "new"
    end
  end

  def logout
    session[:id_of_current_user] = nil
    session[:just_signed_up] = nil
    redirect_to root_path, notice: "You are logged out."
  end

  private
  def parameters_of_session
    params.require(:provided_parameters).permit(:email, :password)
  end
end