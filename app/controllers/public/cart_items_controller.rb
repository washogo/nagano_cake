class Public::CartItemsController < ApplicationController
before_action :authenticate_customer!
before_action :correct_customer, only:[:update]
  def index
    @cart_items=CartItem.where(customer_id: current_customer.id)
  end

  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
    @item=Item.find(params[:cart_item][:item_id])
    @cart_item.item_id=@item.id

    if CartItem.find_by(item_id: @item.id)
      @cart_item_present=CartItem.find_by(item_id: @item.id)
      _amounts = @cart_item_present.amount + @cart_item.amount.to_i
      @cart_item_present.update_attribute(:amount, _amounts)
    else
      @cart_item.save
    end
      redirect_to cart_items_path

  end

  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items=CartItem.where(customer_id: current_customer.id)
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

  def correct_customer
    @cart_item=CartItem.find(params[:id])
    redirect_to root_path unless @cart_item.customer_id == current_customer.id
  end
end
