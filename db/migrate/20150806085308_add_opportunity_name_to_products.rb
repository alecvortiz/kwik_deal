class AddOpportunityNameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :opportunity_name, :string
  end
end
