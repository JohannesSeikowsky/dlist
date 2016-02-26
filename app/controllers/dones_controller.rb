class DonesController < ApplicationController
  # create stack
  def new
    @user = return_current_user
    @done = @user.dones.build
    @users_dones = @user.dones
  end

  def create
    @user = return_current_user
    @done = @user.dones.build(parameters_of_done)
    if @done.save
      redirect_to new_user_done_path(@user), notice: "added."
    else
      flash.now.notice = "Parameters insufficient. Try again." 
      render 'new'
    end
  end

  # edit stack
  def edit
    @user = return_current_user
    @done = Done.find(params[:id])
  end

  def update
    @done = Done.find(params[:id])
    @done.update(content: params[:done][:content])

    redirect_to new_user_done_path(return_current_user, @done), notice: "updated."
  end

  # destroy stack
  def destroy
    @done = Done.find(params[:id])
    @done.destroy
    redirect_to new_user_done_path(return_current_user), notice: "destroyed."
  end

  private
  def parameters_of_done
    params.require(:done).permit(:content, :user_id)
  end
end