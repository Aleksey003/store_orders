class AddQuantityToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :quantity, :float
  end
end
