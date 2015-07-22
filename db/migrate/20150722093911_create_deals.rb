class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :user_id
      t.string :city_planner
      t.string :account_name
      t.date :close_date
      t.string :feature_country
      t.string :name
      t.string :payment_terms
      t.integer :months_to_expiration
      t.integer :capacity_info
      t.text :fine_print
      t.text :highlights
      t.text :description
      t.string :fulfill_method
      t.float :freight_allowance
      t.integer :max_delivery_days
      t.string :email_to
      t.string :courier
      t.integer :shipping_sla
      t.string :brand
      t.string :stage

      t.timestamps null: false
    end
  end
end
