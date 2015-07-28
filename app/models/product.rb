class Product < ActiveRecord::Base
    belongs_to :deal
    #validate all fields
    #     validates deal_id :option_name, :expiration_type, :months_to_expiration, :days_to_expiration, :unit_value, :unit_sell_price, :option_commission, :buyer_max, :option_cap, 
    # :display_order, :sell_number, :units_per_carton, :cartons_per_pallet, :pallets_stackable, :est_shipping_cost, :country_origin, :dimensions_uom, 
    # :weight_uom, :retail_package_height, :retail_package_length, :retail_package_weight, :retail_package_width, :master_carton_height, :master_carton_length, 
    # :master_carton_weight, :master_carton_width, presence: true
    
    # validate numerical info
    # validates :months_to_expiration, :days_to_expiration, :unit_value, :unit_sell_price, :option_commission, :buyer_max, :option_cap, :display_order, :sell_number, :units_per_carton, :cartons_per_pallet, :est_shipping_cost, numericality: :true
    # validate dimensions
    # validates :retail_package_height, :retail_package_length, :retail_package_width, :retail_package_weight, :product_dimension_height, :product_dimension_length, :product_dimension_width, :product_dimension_weight, :master_carton_height, :master_carton_length, :master_carton_width, :master_carton_weight, numericality: :true
end 