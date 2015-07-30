class DealsController < ApplicationController

  def index
    @deals = current_user.deals
  end

  def show
    @deal = Deal.find(params[:id])
    @new_product = Product.new(:deal => @product)
  end
  
  def personal
    redirect_to deals_path, notice: "You need to be an admin to view that page." unless current_user && current_user.admin?
    @users = User.all
	 	@deals = Deal.all
  end
  
  def show_all
      redirect_to deals_path, notice: "You need to be an admin to view that page." unless current_user && current_user.admin?
      @deals = Deal.all
  		if params[:q]
  			@deals = Deal.where("stage LIKE ? or name LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
  		else
  		   @deals = Deal.all
  		end  
	end
	
	def all_users
	  redirect_to deals_path, notice: "You need to be an admin to view that page." unless current_user && current_user.admin?
	  @deals = Deal.all
		if params[:q]
			@users = User.where("email LIKE ?", "%#{params[:q]}%")
		else
		   @users = User.all
		end
	end
  
  def new
    @deal = Deal.new
  end
  
  def create
    @user = current_user
    @deal = current_user.deals.create(deals_params)
    @deal.stage = "Need Review"
    if @deal.save 
      redirect_to deals_path, notice: "Deal succesfully created."

    else      

      render 'new'
    end
  end
  
  def clone
    @deals = current_user.deals
    @deal = current_user.deals.find(params[:id]).dup
    @deal.stage = "Need Review"
    # count = 0
    @deals.find(params[:id]).products do |product|
      @product = @deal.products.new
      @product = product.dup
      # @deal.products[count] = product.dup
      @product.save
      # count = count + 1
    end
      
    # @deal.products = current_user.deals.find(params[:id]).products
    
    @deal.save
    render 'index'
  end
  
  def edit
    	 	@deal = Deal.find params[:id]
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
  
  def approve
    @deals = Deal.all
    deal = Deal.find(params[:id])
    deal.stage = "Approved"
    deal.save
      render 'show_all'
  end
  
  def deny
    @deals = Deal.all
    deal = Deal.find(params[:id])
    deal.stage = "Denied"
    deal.save
      render 'show_all'
  end
  
  private
    def deals_params
      params.require(:deal).permit(:city_planner, :account_name, :close_date, :feature_country, :name, :payment_terms, :months_to_expiration, :capacity_info, :fine_print, :highlights, :description, :fulfill_method, :freight_allowance, :max_delivery_days, :email_to, :courier, :shipping_sla, :brand, :stage)
    end 
end
