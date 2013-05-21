class Asset < ActiveRecord::Base
  belongs_to :product
  attr_accessible :caption, :data, :product_id
  has_attached_file :data, :styles => { 
    :medium => "300x300>",
    :thumb => "50x50>"}
   
  #
  include Rails.application.routes.url_helpers
  def to_jq_upload
    {
      "name" => read_attribute(:data_file_name),
      "size" => read_attribute(:data_file_size),
      "url" => data.url(:thumb),
      "delete_url" => asset_path(self),
      "delete_type" => "DELETE" 
    }
  end
  #
end
