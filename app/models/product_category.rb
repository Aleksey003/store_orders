class ProductCategory < ActiveRecord::Base
  attr_accessible :name
	has_many :product
end
