desc "reminder email. to be send on wednesdays and sundays."
task :weekly_mailer => :environment do
  @users = User.all
  if Time.now.strftime("%A") == "Wednesday" || Time.now.strftime("%A") == "Sunday"
     @users.each do |user|
      AppMailer.reminder(user).deliver 
      sleep 15 #seconds
    end
  end
end