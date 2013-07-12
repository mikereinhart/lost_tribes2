class MessageMailer < ActionMailer::Base
  default from: "admin@losttribes.com"
  
  def sample_email(user)
    @user = user
    @url = 'http://brewtribe.herokuapp.com/'
    mail(to: @user.email, subject: 'Sample email to get things going!')
  end
end

