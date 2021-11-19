class Admin::OrdersController < ApplicationController
    def show
        @order=Order.find(params[:id])
    end

    def update
        @order=Order.find(params[:id])
        @order.update(order_params)
        redirect_to admin_root_path
    end

    private
    def order_params
        params.require(:order).permit(:ordered_status, order_item_attributes: [:maling_status, :_destroy, :id])
    end
end
