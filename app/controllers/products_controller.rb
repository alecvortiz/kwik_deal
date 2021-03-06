class ProductsController < ApplicationController
  include ProductsHelper
  
  def all
    @products = Product.all
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
      format.xls
    end
  end
  
  def index
    
  end
  
  def create
    @deal = Deal.find params[:deal_id]
		@product = @deal.products.create(product_params)
		@product.opportunity_name = @deal.opportunity_name
		redirect_to deal_path(@deal)
		flag_check(@deal, @product)
  end

  def new 
    @deal = Deal.find params[:deal_id]
    @product = @deal.products.new
  end
  
  def edit
    @deal = Deal.find params[:deal_id]
    @product = @deal.products.find params[:id]
  end
  
  def show
    @deal = Deal.find params[:deal_id]
    @product = @deal.products.find params[:id]
  end
  
  def update 
    @deal = Deal.find params[:deal_id]
    @product = @deal.products.find params[:id]
    if @product.update(product_params)
      @product.opportunity_name = @deal.opportunity_name
      flag_check(@deal, @product)
      redirect_to deal_path(@deal)
    else
      render 'edit'
    end
  end
  
  def destroy 
    @deal = Deal.find params[:deal_id]
    @product = @deal.products.find params[:id]
    @product.destroy
    redirect_to deal_path(@deal)
  end 
  
  private
  def product_params 
    params.require(:product).permit(:deal_id, :option_name, :expiration_type, :months_to_expiration, :days_to_expiration, :unit_value, :unit_sell_price, :unit_buy_price, :option_commission, :buyer_max, :option_cap, 
    :display_order, :sell_number, :units_per_carton, :cartons_per_pallet, :pallets_stackable, :est_shipping_cost, :country_origin, :dimensions_uom, 
    :weight_uom, :retail_package_height, :retail_package_length, :retail_package_weight, :retail_package_width, :master_carton_height, :master_carton_length, 
    :master_carton_weight, :master_carton_width, :avatar, :opportunity_name)
  end
end
