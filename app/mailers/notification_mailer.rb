class NotificationMailer < ActionMailer::Base
  default from: "PilotCarFinder <postmaster@pilotcarfinder.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.new_message.subject
  #
  def new_message(notification)
    @notification = notification
    @listing = @notification.listing
    @trucker = @notification.trucker

    mail to: @listing.contactemail, 
    subject: "PCF Request for #{@listing.title}"
  end
end
