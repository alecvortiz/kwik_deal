class DealsController < ApplicationController

  def index
    @deals = current_user.deals
  end

  def show
    @deal = Deal.find(params[:id])
    @new_product = Product.new(:deal => @product)
  end
  
  def show_all
      @deals = Deal.all
  		if params[:q]
  			@deals = Deal.where("stage LIKE ? or name LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
  		else
  		   @deals = Deal.all
  		end  
	end
  
  def new
    @deal = Deal.new
  end
  
  def create
    @deal = current_user.deals.create(deals_params)
    if @deal.save 
      redirect_to deals_path, notice: "Deal succesfully created."
    else
      render 'new'
    end
  end
  
  def clone
    @deals = current_user.deals
    @deal = current_user.deals.find(params[:id]).dup
    @deal.products = current_user.deals.find(params[:id]).products
    @deal.save
    render 'index'
  end
  
  def edit
    	 	@deal = current_user.deals.find params[:id]
  end
  
  def update 
      @deal = current_user.deals.find(params[:id])
  		if @deal.update(deals_params)
   	    	redirect_to deals_path
   	    else 
   			render 'edit'
   		end
  end
  
  def destroy 
    deal = current_user.deals.find params[:id]
	 	deal.destroy
	 	redirect_to "/", notice: "Deal successfully deleted."
  end 
  
  private
    def deals_params
      params.require(:deal).permit(:city_planner, :account_name, :close_date, :feature_country, :name, :payment_terms, :months_to_expiration, :capacity_info, :fine_print, :highlights, :description, :fulfill_method, :freight_allowance, :max_delivery_days, :email_to, :courier, :shipping_sla, :brand)
    end 
end
