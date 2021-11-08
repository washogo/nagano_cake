class Order < ApplicationRecord
  enum payment_method: {credit_card:1,transfer:2}
  enum ordered_status: {payment_waiting:1,payment_confirmation:2,in_production:3,preparing_delivery:4}
  belongs_to :customer
  has_many:order_items

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
end
