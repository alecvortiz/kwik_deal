class Deal < ActiveRecord::Base
    belongs_to :user
    has_many :products
    # validates :city_planner, :account_name, :close_date, :feature_country, :name, :payment_terms, :months_to_expiration, :capacity_info, :fine_print, :highlights, :description, :fulfill_method, :freight_allowance, :max_delivery_days, :email_to, :courier, :shipping_sla, :brand, presence: true
    # validates :months_to_expiration, :capacity_info, :freight_allowance, :shipping_sla, numericality: :true
end
