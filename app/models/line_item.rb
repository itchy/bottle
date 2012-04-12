class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  
  def display_price
    sprintf("$%0.2f", price)
  end
  
  def price
    product.list_price * quantity
  end
  
  def details
    {line_item: {product_id: product.id, quantity: quantity, price: display_price}}
  end
end
