class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
    @alabama = @categories[0]
    @alaska = @categories[1]
    @arizona = @categories[2]
    @arkansas = @categories[3]
    @california = @categories[4]
    @colorado = @categories[5]
    @connecticut = @categories[6]
    @delaware = @categories[7]
    @florida = @categories[8]
    @georgia = @categories[9]
    @hawaii = @categories[10]
    @idaho = @categories[11]
    @illinois = @categories[12]
    @indiana = @categories[13]
    @iowa = @categories[14]
    @kansas = @categories[15]
    @kentucky = @categories[16]
    @louisiana = @categories[17]
    @maine = @categories[18]
    @maryland = @categories[19]
    @massachusetts = @categories[20]
    @michigan = @categories[21]
    @minnesota = @categories[22]
    @mississippi = @categories[23]
    @missouri = @categories[24]
    @montana = @categories[25]
    @nebraska = @categories[26]
    @nevada = @categories[27]
    @newhampshire = @categories[28]
    @newjersey = @categories[29]
    @newmexico = @categories[30]
    @newyork = @categories[31]
    @northcarolina = @categories[32]
    @northdakota = @categories[33]
    @ohio = @categories[34]
    @oklahoma = @categories[35]
    @oregon = @categories[36]
    @pennsylvania = @categories[37]
    @puertorico = @categories[38]
    @rhodeisland = @categories[39]
    @southcarolina = @categories[40]
    @southdakota = @categories[41]
    @tennessee = @categories[42]
    @texas = @categories[43]
    @utah = @categories[44]
    @vermont = @categories[45]
    @virginia = @categories[46]
    @washington = @categories[47]
    @westvirginia = @categories[48]
    @wisconsin = @categories[49]
    @wyoming = @categories[50]
  end
  
  def show
    @category = Category.find(params[:id])
    @listings = Listing.where(category_id: params[:id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @subcategories = Subcategory.where(category_id: params[:id])
  end
  
  private
  
  def set_category
   @category = Category.find(params[:id])
  end
  
end