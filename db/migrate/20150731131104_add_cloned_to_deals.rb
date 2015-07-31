class AddClonedToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :cloned, :boolean
  end
end
