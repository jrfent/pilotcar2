class SubcategoriesController < ApplicationController

  before_filter :set_category
  before_filter :set_subcategory, only: :show

  def show
    @listings = @subcategory.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def find_by_category
    @subcategories = @category.subcategories.find_all
    render json: { subcategories: @subcategories }
  end

  private

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_subcategory
      @subcategory = Subcategory.find(params[:id])
    end

end
