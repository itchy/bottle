class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  
  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:product_id => product_id)  
    end
    current_item  
  end
  
  def total_price
    line_items.inject(0) { |sum, i| sum += i.price }
  end
  
  def display_price
    price = "Total: " + sprintf("$%0.2f", total_price)
    if line_items.inject(0) { |sum, i| sum += i.quantity} >= 10
      price = "#{price} <br/>Discount: - #{sprintf("$%0.2f", total_price*0.1)}"
      price = "#{price} <br/>Final: #{sprintf("$%0.2f", total_price*0.9)}"
    end
      price
    end
    def paypal_price
    price = sprintf("%0.2f", total_price)
    if line_items.inject(0) { |sum, i| sum += i.quantity} >= 10
      price = "#{sprintf("%0.2f", total_price*0.9)}"
    end
     price
  end
  end
