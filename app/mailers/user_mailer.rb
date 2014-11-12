class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def user_deleted(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email,
         subject: 'You have been successfully deleted.',
         # template_path: 'notifications', ####app/view/NOTIFICATIONS/another
         # template_name: 'another')
  end
end

#send.user_deleted
#arguments as users email

#skeleton 
#foundation 
#bourbon
