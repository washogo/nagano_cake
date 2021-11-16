class Item < ApplicationRecord
  belongs_to:genre
  attachment:image
  has_many:cart_items
  has_many:order_items
  
  include ApplicationHelper
  
  def withTax
    return addTax(self.price,1.1)
  end
end
