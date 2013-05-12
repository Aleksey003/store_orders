class ProductCategory < ActiveRecord::Base
  attr_accessible :name,  :parent_id
  has_many :product  
  validates :name, presence: true

  has_ancestry #gem  ancestry
end
