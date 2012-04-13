require 'spec_helper'

describe Order do
  before(:each) do
    @order = Order.new
  end  
  
  # pending "add some examples to (or delete) #{__FILE__}"
  it "should generate a unique 10 digit order number for each order" do
    @order.number.should be_present
    @order.number.should match(/[1-9 A-Z]{10}/)
  end  
end
