module ProductsHelper
    def flag_check(newDeal, newProduct)
        current_user.deals.each do |deal|
            if !deal.products.empty?
                if deal.name == newDeal.name && deal.id != newDeal.id
                    deal.products.each do |product|
                        if newProduct.option_name == product.option_name && newProduct.unit_sell_price != product.unit_sell_price
                            newDeal.flag = true
                            newDeal.save
                        else
                            newDeal.flag = false
                            newDeal.save
                        end
                    end
                end
            end
        end
    end
end
