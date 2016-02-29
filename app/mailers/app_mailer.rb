class AppMailer < ApplicationMailer
  default from: "yourdonelist@gmail.com"

  def signup(user)
    @user = user
    mail(to: user.email, subject: "Welcome to DoneList!")
  end

  def notification(user)
    @user = user
    mail(to: "seikowsky@gmail.com", subject: "New DoneList User.")
  end

  def reminder(user)
    @user = user
    @dones = user.dones
    mail(to: user.email, subject: "A reminder of your awesomeness.")
  end
end