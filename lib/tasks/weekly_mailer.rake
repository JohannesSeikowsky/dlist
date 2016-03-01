desc "reminder email. to be send on wednesdays and sundays."
task :weekly_mailer => :environment do
  require 'time'
  t = Time.now
  @users = User.all
  
  if t.strftime("%A") == "Tuesday" || t.strftime("%A") == "Sunday"
     @users.each do |user|
      AppMailer.reminder(user).deliver 
      sleep 15 #seconds
    end
  end
end