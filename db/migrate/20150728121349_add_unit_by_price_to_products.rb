class AddUnitByPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :unit_buy_price, :float
  end
end
