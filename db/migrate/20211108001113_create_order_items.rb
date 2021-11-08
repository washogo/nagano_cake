class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer    :item_id           ,null:false
      t.integer    :order_id          ,null:false
      t.integer    :tax_included_price,null:false
      t.integer    :quantity          ,null:false
      t.integer    :making_status     ,null:false,default:"1"
      t.timestamps                     null:false,default:"now"
    end
  end
end
