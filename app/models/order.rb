class Order < ActiveRecord::Base
  attr_accessible :cart_details, :collected, :number, :shiped, :stripe_token, :total
end
