class OrderItem < ApplicationRecord
  enum making_status: {production_pending:1,in_production:2,production_complete:3,production_not_possible:4}
  belongs_to:item
  belongs_to:order
end
