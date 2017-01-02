class PinsController < ApplicationController
before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end
  
  def _show
    @listing = Listing.find(params[:id])
    @pins = Pin.where(listing_id: params[:id])
  end
  
  def show
  end

  def new
    @pin = Pin.new
    @listing = Listing.find(params[:listing_id])
    @pin = @listing.pins.build
    @pin.pilot = current_pilot
  end

	def create
	    @listing = Listing.find_by_slug(params[:listing_id])
	    @pin = @listing.pins.create(pins_params)
      @pin.pilot = current_pilot
      @pin.save!
      redirect_to listing_path(@listing), notice: 'Picture was successfully created.'
	end
  
  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Picture was successfully updated.'
    else
      render :edit
    end
  end
  
  def edit
  end
  
  def destroy
    @pin.destroy
    redirect_to :back
  end

private
  
  def set_pin
    @pin = Pin.find_by(id: params[:id])
  end

  def correct_pilot
    @pin = current_pilot.pins.find_by(id: params[:id])
    redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
  end

	def pins_params
	   params.require(:pin).permit(:description, :image, :created_at, :updated_at)
	end

end