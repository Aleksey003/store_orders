class AddPriceToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :price, :float, default: 0
  end
end
