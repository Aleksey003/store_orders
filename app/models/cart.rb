class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
  	current_line = line_items.find_by_product_id(product_id)
  	if current_line
  		current_line.quantity += 1
  	else
  		product = Product.find(product_id)
  		current_line = line_items.build(product: product, quantity: 1, price: product.price )
  	end
  		current_line
  end

  def total_price
    line_items.to_a.sum {|item| item.quantity * item.price}
  end
end
