class AppMailer < ApplicationMailer

  default from: "yourdonelist@gmail.com"

  def signup(user)
    @user = user
    mail(to: user.email, subject: "Welcome to DoneList.")
  end

  def every_third_day(arg1, arg2)
    mail(to: user.email, subject: "you are great")
  end

end