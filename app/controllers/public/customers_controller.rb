class Public::CustomersController < ApplicationController
before_action :authenticate_customer!
  def show
    @customer=current_customer
  end
  
  def edit
    @customer=current_customer
  end
  
  def update
  end
  
  def cancel
  end
  
  def quit
  end
  
end
