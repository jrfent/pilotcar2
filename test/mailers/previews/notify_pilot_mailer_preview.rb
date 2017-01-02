# Preview all emails at http://localhost:3000/rails/mailers/notify_pilot_mailer
class NotifyPilotMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notify_pilot_mailer/new_notify
  def new_notify
    notification = "Notification.last"
    NotifyPilotMailer.new_notify(notification)
  end

end
