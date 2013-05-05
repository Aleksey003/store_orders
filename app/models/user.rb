class User < ActiveRecord::Base

  ROLES = %w[admin moderator customer]
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :discount, :email, :name, :password_digest, :password, :password_confirmation, :logo, :role
  belongs_to :user_state
  belongs_to :parent,class_name: "User", foreign_key: "user_id"
	has_many :children, class_name: "User"
  has_many :carts
  has_many :line_items
  has_many :orders
  validates :email, presence: true, uniqueness: true
	validates :email,  :name, presence: true
  validates :role, inclusion: ROLES
  
	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "50x50>" }	

  def	method_missing method_name, *arg
		method_name = method_name.to_s.delete "?"
		if ROLES.include? method_name
			method_name == role
		else
			super
		end
	end
end
