class OrderItem < ApplicationRecord
  enum making_status: {production_not_possible:1,production_pending:2,in_production:3,production_complete:4}
  belongs_to:item
  belongs_to:order
end
