desc "weekly_mailer"
task :weekly_mailer => :environment do
  @users = User.all
   @users.each do |user|
    AppMailer.reminder(user).deliver
  end
end