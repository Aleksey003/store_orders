class User < ActiveRecord::Base
  attr_accessible :discount, :email, :name, :password_digest, :password, :password_confirmation, :logo
  belongs_to :user_state
  belongs_to :parent,class_name: "User", foreign_key: "user_id"
	has_many :children, class_name: "User"

  validates :email, presence: true, uniqueness: true
	validates :email, :logo, :name, presence: true

  has_secure_password
	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "50x50>" }
end
