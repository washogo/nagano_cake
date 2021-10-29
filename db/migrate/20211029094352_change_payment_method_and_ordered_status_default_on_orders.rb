class ChangePaymentMethodAndOrderedStatusDefaultOnOrders < ActiveRecord::Migration[5.2]
  def change
    change_column:orders,:payment_method,:integer,default:1
    change_column:orders,:ordered_status,:integer,default:1
  end
end
