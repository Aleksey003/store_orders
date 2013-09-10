class Order < ActiveRecord::Base

  STATUS = %w[new check]
  
  attr_accessible :comment, :order_date, :email, :user

  validates :email, :user, presence: true
  validates :order_date, presence: true
  validates :status, inclusion: STATUS
  has_many :line_items, dependent: :destroy
  belongs_to :user

  self.per_page = 20

  #before_save :check_and_post_order
  
 
  def add_line_items_from_cart(cart)
  	cart.line_items.each do |l|
  		line_items << l  		
  		l.cart_id = nil
  	end 		  	
  end

  def total_price
  	line_items.to_a.sum { |item| item.quantity * item.price}
  end

  private
  
  def check_and_post_order
    
    if status == 'new'
      responce = post_order
      if !responce
        status = 'check'
      end
    end
  end

  def post_order    
    line_items_array = []
    line_items.each do |items|
      line_items_array << {:'sam:Id'=>items.product_id, :'sam:Quantity'=> items.quantity, :'sam:Price'=> items.price}
    end
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
      response = client.call(:put_order, message: { :'uri:email'=>email, :'uri:user'=>user.id, :'uri:date'=>order_date, :'uri:Products'=> {:'sam:Product_quantity_price_line'=>line_items_array}})
    rescue
      return false
    end
    hash_responce = response.to_hash[:put_order_response][:return]

  end



end
