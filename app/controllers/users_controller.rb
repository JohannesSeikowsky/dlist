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
      session[:just_signed_up] = "correct"
      @initial_done = @user.dones.build(content: "Signed up for DoneList. :)").save
      redirect_to new_user_done_path(@user), notice: "Welcome #{@user.name}!"
    else
      redirect_to signup_path, notice: "Parameters insufficient. Try again."
    end
  end

  private
    def parameters_of_user
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end