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
end
