class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]
  before_action :correct_pilot, only: [:edit, :update, :destroy, :clone]
  before_filter :load_load, only: :new



  def index
    @bids = Bid.all
  end

  def show
  end

  def new
    @bid = Bid.new
    @bid = @load.bids.build
    @bid.pilot = current_pilot
  end

  def edit
  end

  def create
    # @bid = @load.bids.build(params[:bid_id])
    @bid = Bid.new(bid_params)

    respond_to do |format|
      if @bid.save
        format.html { redirect_to @bid, notice: 'Bid was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bid }
      else
        format.html { render action: 'new' }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to bids_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def load_load
      @load = Load.find(params[:load_id])
    end
    
    def set_bid
      @bid = Bid.find(params[:id])
    end
    
    def correct_pilot
      @load = current_pilot.bids.find_by(id: params[:id])
      redirect_to bids_path, notice: "Not authorized to edit this bid request" if @bid.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:fee, :pilot_id, :load_id)
    end
end
