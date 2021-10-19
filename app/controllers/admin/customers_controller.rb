class Admin::CustomersController < ApplicationController
  def show
    @customer=Customer.find(params[:id])
  end
  
  def index
    @customers=Customer.page(params[:page]).per(10)
  end
  
  def edit
  end
  
  def update
  end

end
