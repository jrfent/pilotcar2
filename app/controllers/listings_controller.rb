class ListingsController < ApplicationController
  before_filter :authenticate_pilot!, only: [:new, :create, :destroy, :edit]
  
  def index
    @listings = Listing.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end
  
  def new
    @listing = Listing.new
  end
  
  def create
    @listing = Listing.new(listing_params)
    @listing.pilot = current_pilot
    @listing.save
    redirect_to @listing
  end
  
  def show
    if (params[:id]).to_i != 0
      @listing = Listing.find(params[:id])
    else
      @listing = Listing.find_by_slug(params[:id])
      raise ActiveRecord::RecordNotFound, "Page not found" if @listing.nil?  
   end
    
    prepare_meta_tags(title: @listing.title,
                          description: @listing.shortdescription,
                          keywords: @listing.state,
                          image: "image link from listing",
                          twitter: {card: "summary_large_image"})
  end
  
  def edit
    @listing = Listing.find_by_slug(params[:id])
  end

  def update
    @listing = Listing.find_by_slug(params[:id])
    @listing.update(listing_params)
    redirect_to @listing 
  end
  
  def destroy
    @listing = Listing.find_by_slug(params[:id])
    @listing.destroy
    redirect_to mylistings_path
  end

  def search
    @listings = Listing.search(params).order("updated_at DESC").paginate(:page => params[:page], :per_page =>10)
  end
  
  def mylistings
    @listings = Listing.where(pilot: current_pilot)
  end
  
  def adminlistings
    @listings = Listing.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end
  
  private
  
  def listing_params
    params.require(:listing).permit(:title, :description, :shortdescription, :city, :state, 
    :zipcode, :contactphone, :contactemail, :category_id, :subcategory_id, 
    :cellphone, :fax, :website, :blog, :facebook, :twitter, :instagram, :pinterest, :google, :slug )
  end
  
end
