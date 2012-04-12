require "spec_helper"

describe CartsController do
  describe "routing" do

    it "routes to #show" do
      { :get => "/cart" }.should route_to("carts#show")
    end
    
    it "routes to #payment" do
      { :get => "payment/:id" }.should route_to(
        :controller => "carts",
        :action => "payment",
        :method => :post,
        :id => ":id"
       )
    end
    
    it "routes to #order" do
      { :post => "/cart/order"}.should route_to(
        :controller => "carts",
        :action => "order",
        :method => :post,
      )
    end

  end
end