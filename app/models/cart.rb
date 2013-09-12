class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy
  belongs_to :user
  self.per_page = 100
  def add_product(product_id, quantity=1)
    quantity = quantity.to_f
  	current_line = line_items.find_by_product_id(product_id)
  	if current_line
  		current_line.quantity += quantity
  	else
  		product = Product.find(product_id)
  		current_line = line_items.build(product: product, quantity: quantity, price: product.price )
  	end
  		current_line
  end

  def total_price
    line_items.to_a.sum {|item| item.quantity * item.price}
  end

  def total_quantity
    line_items.to_a.sum {|item| item.quantity}
  end
end
