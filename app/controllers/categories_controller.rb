class CategoriesController < ApplicationController

  before_filter :set_category, only: :show

  def index
    @categories = Category.all.order(:name)
  end

  def show
    @listings = @category.listings.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @subcategories = @category.subcategories
  end

  private

    def set_category
     @category = Category.find(params[:id])
    end

end
