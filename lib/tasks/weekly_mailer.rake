desc "reminder email. to be send on wednesdays and sundays."
task :reminder => :environment do
  @users = User.all
   @users.each do |user|
    AppMailer.reminder(user).deliver
    sleep 15 #seconds
  end
end