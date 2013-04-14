class Product < ActiveRecord::Base
  attr_accessible :description, :product_category, :product_state, :title, :assets, :assets_attributes, :product_state_id, :product_category_id
	belongs_to :product_category
	belongs_to :product_state
	has_many :assets, :dependent => :destroy
	accepts_nested_attributes_for :assets, :allow_destroy => true
	self.per_page = 12

	before_destroy :check_references_by_line_items

	def check_references_by_items
		if line_items.empty?
			return true
		else
			errors.add(:base, 'there is references in cart')
			return false
		end
	end
end
