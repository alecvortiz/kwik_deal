class DealsController < ApplicationController

  def index
    @deals = current_user.deals
    @deals = current_user.deals.select { |deal| deal.stage == "Complete" }
    respond_to do |format|
      format.html
      format.csv { send_data @deals.to_csv }
      format.xls 
    end
    if params[:q]
  			@deals = current_user.deals.where("LOWER(stage) LIKE ? or LOWER(name) LIKE ?", "%#{params[:q].downcase}%", "%#{params[:q].downcase}%")
  		else
  		   @deals = current_user.deals
  		end  
  end

  def show
    @deal = Deal.find(params[:id])
    @new_product = Product.new(:deal => @product)
    @new_comment = Comment.new(:deal => @deal)
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
  			@deals = Deal.where("LOWER(stage) LIKE ? or LOWER(name) LIKE ?", "%#{params[:q].downcase}%", "%#{params[:q].downcase}%")
  		else
  		   @deals = Deal.all
  		end  
	end
	
  
  def new
    @deal = Deal.new
  end
  
  def create
    @user = current_user
    @deal = current_user.deals.create(deals_params)
    @deal.stage = "Prospecting"
    @deal.flag = false
    @deal.opportunity_name = @deal.name + ' - ' + @deal.id.to_s
    if @deal.save 
      redirect_to deals_path, notice: "Deal succesfully created."
    else      

      render 'new'
    end
  end
  
  def clone
    @deals = current_user.deals
    @deal = current_user.deals.find(params[:id]).amoeba_dup
    @deal.stage = "Prospecting"
    @deal.flag = false
    @deal.cloned = true
    @deal.opportunity_name = @deal.name + ' - ' + @deal.id.to_s
    @deal.save
    render 'clone'
  end
  
  def edit
    @deal = Deal.find params[:id]
  end
  
  def update 
      @deal = Deal.find(params[:id])
  		if @deal.update(deals_params)
      @deal.opportunity_name = @deal.name + ' - ' + @deal.id.to_s
  		    if current_user.role == "admin"
  		      redirect_to show_all_path
  		    else 
   	    	  redirect_to deals_path
   	    	end
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
    redirect_to deal_path(deal)
  end

  private
    def deals_params
      params.require(:deal).permit(:city_planner, :account_name, :close_date, :feature_country, :name, :payment_terms, :months_to_expiration, :capacity_info, :fine_print, :highlights, :description, :fulfill_method, :freight_allowance, :max_delivery_days, :email_to, :courier, :shipping_sla, :brand, :stage, :opportunity_name)
    end 
end
