class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer    :customer_id   ,null:false
      t.string     :postal_code   ,null:false
      t.string     :address       ,null:false
      t.string     :name          ,null:false
      t.integer    :postage       ,null:false,default:"800"
      t.integer    :billing_amount,null:false
      t.integer    :payment_mehod ,null:false
      t.integer    :ordered_status,null:false
      t.timestamps                 null:false,default:""
    end
  end
end
