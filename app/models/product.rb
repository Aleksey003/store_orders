class Product < ActiveRecord::Base
  attr_accessible :description, :product_category_id, :product_state_id, :title
	belongs_to :product_category
	belongs_to :product_state
	has_many :assets, :dependent => :destroy
end
