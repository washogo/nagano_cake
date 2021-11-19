class Public::AddressesController < ApplicationController
before_action :authenticate_customer!
before_action :correct_customer, only:[:edit,:update,:destroy]
  def index
    @address=Address.new
    @addresses=Address.all
  end

  def create
    @address=Address.new(address_params)
    @address.customer_id=current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address=Address.find(params[:id])
    if @address.customer_id == current_customer
      redirect_to address_path(@address.id)
    else
      render :edit
    end
  end

  def update
    @address=Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address=Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code,:address,:name)
  end

  def correct_customer
    @address = Address.find(params[:id])
    redirect_to root_path unless @address.customer_id == current_customer.id
  end
end
