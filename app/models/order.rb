class Order < ApplicationRecord
  enum payment_mehod:{"クレジットカード":1,"銀行振込":2}
  enum ordered_status:{"入金待ち":1,"入金確認":2,"制作中":3,"発送準備中":4}
end
