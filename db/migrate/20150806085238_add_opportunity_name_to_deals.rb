class AddOpportunityNameToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :opportunity_name, :string
  end
end
