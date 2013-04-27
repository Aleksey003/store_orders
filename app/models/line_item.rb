class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order
  attr_accessible :product, :price, :quantity
end
