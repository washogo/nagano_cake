class ChangeIsFlagDegaultOnOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column:orders,:payment_mehod,:payment_method
  end
end
