class Item < ApplicationRecord
  belongs_to:genre, optional: true
  has_many:cart_items
  has_many:order_items

  attachment :image

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :is_active, presence: true

  include ApplicationHelper

  def withTax
    return addTax(self.price,1.1)
  end
end
