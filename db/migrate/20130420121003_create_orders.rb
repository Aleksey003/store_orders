class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.references :user
      t.text :comment
      t.string :email

      t.timestamps
    end
  end
end
