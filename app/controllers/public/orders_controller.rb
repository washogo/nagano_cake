class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order=Order.new
    @customer=current_customer
    @order.customer_id=@customer.id
    @addresses=Address.where(customer_id: current_customer.id)
  end

  def confirmation
    @order=Order.new(order_params)
    @order.order_items.build
    @cart_items=CartItem.where(customer_id: current_customer.id)

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
    current_customer.cart_items.each do |cart_item|
      @order_item=OrderItem.new
      @order_item.tax_included_price=cart_item.item.withTax
      @order_item.quantity=cart_item.amount
      @order_item.order_id=@order.id
      @order_item.item_id=cart_item.item_id
      @order_item.save
  end

    CartItem.destroy_all
    redirect_to orders_completed_path
  end

  def index
    @orders=Order.includes(:order_items).where(customer_id: current_customer.id)
  end

  def show
    @order=Order.find(params[:id])
  end

  def completed
  end

  private
  def order_params
    params.require(:order).permit(:payment_method,:name,:postal_code,:address,:billing_amount)
  end

end
