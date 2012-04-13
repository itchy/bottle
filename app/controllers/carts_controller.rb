class CartsController < ApplicationController
  # # GET /carts
  # # GET /carts.json
  # def index
  #   redirect_to :action => 'show', :id => "1"
  # end
  # 
  # # GET /carts/1
  # # GET /carts/1.json
  
  def show
    begin
      # @cart = Cart.find(params[:id])
      @cart = current_cart
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart with id: #{params[:id]}"
      flash[:notice] = "Invalid Cart" 
      redirect_to controller: "home", action: "buy"
    else  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @cart }
      end
    end  
  end
  
  # get shipping info
  def shipping
    @address = Address.new
  end
  
  # verify shipping address & create order
  def payment
    @address = Address.new(params[:address])
    if @address.save
      @cart = current_cart
      @order = current_order
      @order.address = @address
      @order.cart_details = @cart.details
      @order.total = @cart.total_price
      @order.save!
    else
      render :shipping
    end    
  end
  
  # verify order and display sucessfull order
  def order
    @cart = current_cart
    @order = current_order
    @order.stripe_token = params[:stripeToken]
    @order.save!
    charge = Stripe::Charge.create(
      :amount => (@order.total.gsub(/\./,'')), # amount in cents, again
      :currency => "usd",
      :card => @order.stripe_token,
      :description => @order.number
    )
    @order.charge = charge
    @order.save!
    clear_current_order
    clear_current_cart
  end

  # # GET /carts/new
  # # GET /carts/new.json
  # def new
  #   @cart = Cart.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @cart }
  #   end
  # end
  # 
  # # GET /carts/1/edit
  # def edit
  #   @cart = Cart.find(params[:id])
  # end
  # 
  # # POST /carts
  # # POST /carts.json
  # def create
  #   @cart = Cart.new(params[:cart])
  # 
  #   respond_to do |format|
  #     if @cart.save
  #       format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
  #       format.json { render json: @cart, status: :created, location: @cart }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @cart.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # PUT /carts/1
  # # PUT /carts/1.json
  # def update
  #   @cart = Cart.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @cart.update_attributes(params[:cart])
  #       format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
  #       format.json { head :ok }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @cart.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # DELETE /carts/1
  # # DELETE /carts/1.json
  # def destroy
  #   @cart = Cart.find(params[:id])
  #   @cart.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to carts_url }
  #     format.json { head :ok }
  #   end
  # end
end
