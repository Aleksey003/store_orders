class User < ActiveRecord::Base
  attr_accessible :discount, :email, :name, :password_digest, :password, :password_confirmation, :logo
  validates :name, presence: true, uniqueness: true
  has_secure_password
	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "50x50>" }
	belongs_to :parent,class_name: "User", foreign_key: "user_id"
	has_many :children, class_name: "User"
	belongs_to :user_state
end
