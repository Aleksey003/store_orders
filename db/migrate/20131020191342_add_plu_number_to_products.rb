class AddPluNumberToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :plu_number, :string
  end
end
