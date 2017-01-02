class NotificationsController < ApplicationController

  def new
    @notification = Notification.new
    @notification = @listing.notifications.build
    @notification.trucker = current_trucker
  end

	def create
	    @listing = Listing.find(params[:listing_id])
	    @notification = @listing.notifications.create(notifications_params)
      @notification.trucker = current_trucker
      @notification.save!
      
      NotificationMailer.new_message(@notification).deliver
	    
      redirect_to listing_path(@listing), notice: 'Message was successfully sent.'
	end

	private

	def notifications_params
	   params.require(:notification).permit(:content)
	end

end