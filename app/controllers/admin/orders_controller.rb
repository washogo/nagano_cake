class Admin::OrdersController < ApplicationController
    def show
        @order=Order.find(params[:id])
    end

    def update
        @order=Order.find(params[:id])
        @order.update(order_params)
        redirect_to admin_path
    end

    private
    def order_params
        params.require(:order).permit(:ordered_status)
    end
end
