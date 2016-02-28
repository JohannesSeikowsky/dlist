class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(parameters_of_user)
    if @user.save
      AppMailer.signup(@user).deliver
      AppMailer.notification(@user).deliver
      session[:id_of_current_user] = @user.id
      @initial_done = @user.dones.build(content: "Signed up for DoneList :)").save
      redirect_to new_user_done_path(@user), notice: "Welcome to DoneList. You have signed up."
    else
      flash.now.notice = "Parameters insufficient. Try again."
      render 'new'
    end
  end

  private
  def parameters_of_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end