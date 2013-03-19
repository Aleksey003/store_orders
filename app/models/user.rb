class User < ActiveRecord::Base
  attr_accessible :discount, :email, :name, :password_digest, :password, :password_confirmation, :logo, :role
  belongs_to :user_state
  belongs_to :parent,class_name: "User", foreign_key: "user_id"
	has_many :children, class_name: "User"

  validates :email, presence: true, uniqueness: true
	validates :email,  :name, presence: true

  has_secure_password
	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "50x50>" }

	ROLES = %w[admin moderator]

  def	method_missing method_name, *arg
		method_name = method_name.to_s.delete "?"
		if ROLES.include? method_name
			method_name == role
		else
			super
		end
	end
end
