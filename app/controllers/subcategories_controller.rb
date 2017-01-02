class SubcategoriesController < ApplicationController
  
  def show
    @listings = Listing.where(subcategory_id: params[:id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:id])
  end
  
  def find_by_category
    category = Category.find(params[:category_id])
    subcategories = category.subcategories.find_all
    render json: { subcategories: subcategories }
  end
  
  def state_category
    category = Category.find(params[:category_id])
  end
  
  private
  
  def set_subcategory
   @subcategory = Subcategory.find(params[:id])
  end
  
end
