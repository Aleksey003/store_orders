class UserState < ActiveRecord::Base
  attr_accessible :name
	has_many :user
end
