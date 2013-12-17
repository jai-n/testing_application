class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  # include SendGrid
  #send welcome mail with password
  def welcome_email(user,password)
    @user = user
    @password = password
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
