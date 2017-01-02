class LoadsController < ApplicationController
  before_action :set_load, only: [:show, :edit, :update, :destroy, :clone]
  # before_action :authenticate_trucker!
  before_action :correct_trucker, only: [:edit, :update, :destroy, :clone]

  def index
    @loads = Load.all
  end

  def show
  end

  def new
    @load = current_trucker.loads.build
  end

  def edit
  end

  def create
    @load = current_trucker.loads.build(load_params)
      if @load.save
        redirect_to @load, notice: 'Load was successfully created.'
      else
        render action: 'new'
      end
  end

  def update
      if @load.update(load_params)
        redirect_to @load, notice: 'Load was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @load.destroy
      redirect_to loads_url
  end
  
  def clone
      @load = Load.find(params[:id]) # find original object
      @load = Load.new(@load.attributes) # initialize duplicate (not saved)
      render :new # render same view as "new", but with @load attributes already filled in
  end
    


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load
      @load = Load.find(params[:id])
    end

    def correct_trucker
      @load = current_trucker.loads.find_by(id: params[:id])
      redirect_to loads_path, notice: "Not authorized to edit this load request" if @load.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def load_params
      params.require(:load).permit(:origin_country, :origin_city, :origin_state, :origin_zipcode, 
      :destination_country, :destination_city, :destination_state, :destination_zipcode, :fee, 
      :fee_type, :distance, :pickup_datetime, :delivery_datetime, :special_notes, :pilotcar_count, 
      :polecar_needed, :current_status)
    end
end
