class Product < ActiveRecord::Base
	
    attr_accessible :description, :product_category, :product_state, :title, :assets, :assets_attributes, :product_state_id, :product_category_id
	belongs_to :product_category
	belongs_to :product_state
	has_many :assets, dependent: :destroy
	has_many :orders, through: :line_items
	accepts_nested_attributes_for :assets, :allow_destroy => true
	self.per_page = 5

	validates :product_category, presence: true
	validates :title, presence: true

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

	def self.get_quantitys(params=[])
		 #Product.first.get_quantitys({:'sam:Id' =>[115, 187, 14] })

		namespaces = {
 		 "xmlns:Sam" => "http://www.sample-package.org",
 		 "xmlns:Uri" => "http://www.uri.com"
		}
		
		client  = Savon.client do 
			wsdl "http://95.158.61.35:8888/InfoBase2/ws/webservice?wsdl"
			basic_auth ["service", "service"]
			convert_request_keys_to :camelcase
			namespaces namespaces
		end
		
		begin	
			response = client.call(:get_quantity_products, message: { :'uri:Products' => {:'sam:Id'=>params} })
		rescue => e			
			logger.error e.message
  			logger.error e.backtrace.join("\n")
  			return []
		end
		hash_responce = response.to_hash[:get_quantity_products_response]		
		response_val = hash_responce[:return][:product_quantity_line]
		unless response_val.kind_of?(Array)
			response_val = [response_val]						
		end			
		return response_val		
	end

end
