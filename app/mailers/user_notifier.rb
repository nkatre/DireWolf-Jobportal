class UserNotifier < ActionMailer::Base
  default from: "system.direwolf@gmail.com"

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
          :subject => 'Thanks for signing up for our DireWolf app' )
  end

  def jobapplication_submitted_email(user)
    @user = user
    mail(:to => @user.email,
        :subject => 'New job application submitted')
  end
  def jobapplication_status_update_email(user)
    @user = user
    mail(:to => @user.email,
         :subject => 'Job application status changed')
  end
end
