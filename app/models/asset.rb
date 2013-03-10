class Asset < ActiveRecord::Base
  belongs_to :product
  attr_accessible :caption, :data
  has_attached_file :data, :styles => { :medium => "300x300>", :thumb => "50x50>" }

end
