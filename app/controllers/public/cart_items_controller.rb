class Public::CartItemsController < ApplicationController
  def index
    @cart_item=CartItem.new
    @cart_items=CartItem.all
  end
  
  def create
    @cart_item=CartItem.new
    @cart_item.item_id=Item.id
    @cart_item.customer_id=current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end
  
  def update
    @cart_item=CartItem.find(params[:id])
    
  end
  
end
