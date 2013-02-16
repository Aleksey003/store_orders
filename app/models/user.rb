class User < ActiveRecord::Base
  attr_accessible :discount, :email, :name, :password_digest, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true
  has_secure_password
	belongs_to :parent,class_name: "User", foreign_key: "user_id"
	has_many :children, class_name: "User"
end
