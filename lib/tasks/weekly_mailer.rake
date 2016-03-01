desc "reminder email. to be send on wednesdays and sundays."
task :weekly_mailer => :environment do
  @users = User.all
   @users.each do |user|
    AppMailer.reminder(user).deliver if Time.now.strftime("%A") == "Wednesday" || Time.now.strftime("%A") == "Sunday"
    sleep 15 #seconds
  end
end