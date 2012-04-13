class ApplicationController < ActionController::Base
  before_filter :identify
  protect_from_forgery
  
  
private
  def identify
    Rails.logger.info "INFO: Controller: #{params[:controller]}"
    Rails.logger.info "INFO: Action: #{params[:action]}"
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
  
  def clear_current_cart
    session[:cart_id] = nil
  end
  
  def current_order
    Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    order = Order.create
    session[:order_id] = order.id
    order
  end
  
  def clear_current_order
    session[:order_id] = nil
  end
end
