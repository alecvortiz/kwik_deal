class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :deal_id
      t.string :option_name
      t.string :expiration_type
      t.integer :months_to_expiration
      t.integer :days_to_expiration
      t.float :unit_value
      t.float :unit_sell_price
      t.float :option_commission
      t.integer :buyer_max
      t.integer :option_cap
      t.integer :display_order
      t.integer :sell_number
      t.integer :units_per_carton
      t.integer :cartons_per_pallet
      t.boolean :pallets_stackable
      t.float :est_shipping_cost
      t.string :country_origin
      t.string :dimensions_uom
      t.string :weight_uom
      t.float :retail_package_height
      t.float :retail_package_length
      t.float :retail_package_width
      t.float :retail_package_weight
      t.float :product_dimension_height
      t.float :product_dimension_length
      t.float :product_dimension_width
      t.float :product_dimension_weight
      t.float :master_carton_height
      t.float :master_carton_length
      t.float :master_carton_width
      t.float :master_carton_weight

      t.timestamps null: false
    end
  end
end
