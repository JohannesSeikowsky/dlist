class PagesController < ApplicationController
  def home
    @user = User.new
  end

  def why
    @user = User.new
  end
  
  def how
    @user = User.new
  end
end