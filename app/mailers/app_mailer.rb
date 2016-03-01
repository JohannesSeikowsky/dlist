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
    @dones = user.dones.order('created_at DESC')
    mail(to: user.email, subject: "Reminding you of your awesomeness.")
  end
end