class Product < ActiveRecord::Base
  attr_accessible :description, :product_category_id, :product_state_id, :title, :assets, :assets_attributes
	belongs_to :product_category
	belongs_to :product_state
	has_many :assets, :dependent => :destroy
	accepts_nested_attributes_for :assets, :allow_destroy => true
end
