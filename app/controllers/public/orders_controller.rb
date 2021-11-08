class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order=Order.new
    @customer=current_customer
    @order.customer_id=@customer.id
    @addresses=Address.all
    @cart_items=CartItem.all

  end

  def confirmation
    @order=Order.new(order_params)
    @cart_items=CartItem.all
    
    if params[:order][:address_option] == "0"
      @order.name=current_customer.first_name + current_customer.last_name
      @order.postal_code=current_customer.postal_code
      @order.address=current_customer.address
    elsif params[:order][:address_option] == "1"
      @address=Address.find(params[:order][:address_id])
      @order.name=@address.name
      @order.postal_code=@address.postal_code
      @order.address=@address.address
    end

  end
  

  def create
    @order=Order.new(order_params)
    @order.customer_id=current_customer.id
    @order.save
    redirect_to orders_completed_path
    byebug
  end

  def index
  end

  def show
  end

  def completed
  end

  private
  def order_params
    params.require(:order).permit(:payment_method,:name,:postal_code,:address,:billing_amount)
  end

end
