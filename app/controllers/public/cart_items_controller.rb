class Public::CartItemsController < ApplicationController
  def index
    @cart_items=CartItem.all
  end

  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
    @item=Item.find(params[:cart_item][:item_id])
    @cart_item.item_id=@item.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items=CartItem.all
    @cart_items.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end

end
