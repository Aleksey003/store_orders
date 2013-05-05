class Order < ActiveRecord::Base

  STATUS = %w[new check]
  
  attr_accessible :comment, :order_date, :email, :user

  validates :email, :user, presence: true
  validates :order_date, presence: true
  validates :status, inclusion: STATUS
  has_many :line_items, dependent: :destroy
  belongs_to :user

  self.per_page = 20
  
 
  def add_line_items_from_cart(cart)
  	cart.line_items.each do |l|
  		line_items << l  		
  		l.cart_id = nil
  	end 		  	
  end

  def total_price
  	line_items.to_a.sum { |item| item.quantity * item.price}
  end
end
