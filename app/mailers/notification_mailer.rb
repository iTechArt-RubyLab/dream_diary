class NotificationMailer < ApplicationMailer
  def good_night(user)
    @user = user
    mail(to: @user.email,
         subject: 'Good night')
  end
end
