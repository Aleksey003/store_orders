class Asset < ActiveRecord::Base
  belongs_to :product
  attr_accessible :caption
  has_attached_file :data, :styles => { :small => “150×150>”, :large => “320×240>” }

end
