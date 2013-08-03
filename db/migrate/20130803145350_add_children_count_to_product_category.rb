class AddChildrenCountToProductCategory < ActiveRecord::Migration
  def change
    add_column :product_categories, :product_count, :integer
  end
end
