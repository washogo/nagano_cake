class Public::HomesController < ApplicationController
  def top
    @items=Item.all
    @items=Item.order(id: :DESC)
  end
end
