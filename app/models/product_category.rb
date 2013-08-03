class ProductCategory < ActiveRecord::Base
  attr_accessible :name,  :parent_id
  has_many :product  
  validates :name, presence: true
  before_save :default_attr
  before_destroy :check_references

  has_ancestry #gem  ancestry

  def default_attr
		self.product_count ||= 0
  end

  def check_references
    if product.empty?
      return true
    else
      errors.add(:base, 'there is references in product')
      return false
    end
  end

  def get_name_for_tree_category
    "#{parent.name unless parent.nil?} - #{name}"
  end

  def self.fill_count_product
  	ProductCategory.all.each do |category|
  		category.product_count = category.product.count
  		category.save
  	end
  end

end
