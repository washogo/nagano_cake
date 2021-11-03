class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order=Order.new
    @customer=current_customer
    @order.customer_id=@customer.id
    @addresses=Address.all
   
  end

  def confirmation
    @order=Order.new
  end

  def create

    @order=Order.new(order_params)
    @order.customer_id=current_customer.id
    @order.save
    redirect_to orders_completed_path
  end

  def index
  end

  def show
  end

  def completed
  end

  private
  def order_params
    params.require(:order).permit(:payment_method,:name,:postal_code,:address)
  end

end
