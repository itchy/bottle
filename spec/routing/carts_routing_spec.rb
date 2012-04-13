require "spec_helper"

describe CartsController do
  describe "routing" do

    it "routes to #show" do
      { :get => "/cart" }.should route_to("carts#show")
    end
    
    it "routes to #shipping" do
      { :get => "shipping/" }.should route_to(
        :controller => "carts",
        :action => "shipping",
        :method => :get
       )
    end

    it "routes to #payment" do
      { :get => "payment" }.should route_to(
        :controller => "carts",
        :action => "payment",
        :method => :post
       )
    end
    
    it "routes to #order" do
      { :post => "/order"}.should route_to(
        :controller => "carts",
        :action => "order",
        :method => :post,
      )
    end

  end
end