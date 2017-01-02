# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/new_message
  def new_message
    notification = Notification.last
    NotificationMailer.new_message(notification)
  end

end
