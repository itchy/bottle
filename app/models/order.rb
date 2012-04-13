class Order < ActiveRecord::Base
  belongs_to :address
  
  def initialize(*args)
    super
    self.number = generate_order_number(10)
  end
  
  def generate_order_number(length)
    r = ('A'..'Z').map{ |l| l}
    r << (1..9).map { |n| n} # I dont want any zeros because of O amd 0 
    r.flatten!
    num = (1..length).map { r[rand(r.size)] }.flatten.join
    # make sure num is unique
    if Order.find_by_number(num)
      generate_order_number(length)
    else
      num
    end    
  end
  
  
end
