class AddQuantityToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :quantity, :double
  end
end
