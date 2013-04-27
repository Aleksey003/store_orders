class Product < ActiveRecord::Base
    attr_accessible :description, :product_category, :product_state, :title, :assets, :assets_attributes, :product_state_id, :product_category_id
	belongs_to :product_category
	belongs_to :product_state
	has_many :assets, dependent: :destroy
	has_many :orders, through: :line_items
	accepts_nested_attributes_for :assets, :allow_destroy => true
	self.per_page = 12

	validate :product_category, presente: true

	before_destroy :check_references_by_line_items

	def check_references_by_items
		if line_items.empty?
			return true
		else
			errors.add(:base, 'there is references in cart')
			return false
		end
	end

	def get_quantity
		client  = Savon.client do 
			wsdl "http://95.158.61.35:8888/InfoBase2/ws/webservice?wsdl"
			basic_auth ["service", "service"]
			convert_request_keys_to :camelcase
		end		
		response = client.call(:get_quantity_product, message: { product_id:  id})
		hash_responce = response.to_hash[:get_quantity_product_response]
		hash_responce[:return]
	end

	#def get_quantitys()
	#	client  = Savon.client do 
			# wsdl "http://95.158.61.35:8888/InfoBase2/ws/webservice?wsdl"
	#		basic_auth ["service", "service"]
	#		convert_request_keys_to :camelcase
	#	end
#
#		responce = client.call(:get_quantity_products)
#		quantity = responce[:return]

#	end
end
