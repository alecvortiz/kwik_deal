class Product < ActiveRecord::Base
    belongs_to :deal
    #     validates deal_id :option_name, :expiration_type, :months_to_expiration, :days_to_expiration, :unit_value, :unit_sell_price, :option_commission, :buyer_max, :option_cap, 
    # :display_order, :sell_number, :units_per_carton, :cartons_per_pallet, :pallets_stackable, :est_shipping_cost, :country_origin, :dimensions_uom, 
    # :weight_uom, :retail_package_height, :retail_package_length, :retail_package_weight, :retail_package_width, :master_carton_height, :master_carton_length, 
    # :master_carton_weight, :master_carton_width, presence: true
end
