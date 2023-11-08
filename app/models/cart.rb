class Cart < ApplicationRecord
    has_many :cart_items
    has_many :products, through: :cart_items

    
    def add_product(product_id, quantity)
        current_item = cart_items.find_by(product_id: product_id)
        if current_item
          current_item.qty = quantity.to_i # 既存の数量と置き換える
        else
          current_item = cart_items.build(product_id: product_id, qty: quantity.to_i)
        end
        current_item.save
        current_item
    end
    
    def total_price
        cart_items.inject(0) { |sum, item| sum + (item.qty * item.product.price) }
    end
end
