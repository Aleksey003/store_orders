require 'spec_helper'
describe "User" do
	it "should create user" do
	  @input_attributes = {name:"sam", password:"1234560", password_confirmation:"123450",discount:1,email:"sam@sam.com"}
		user = User.new @input_attributes
		user.user_id = 1
		user.should_not nil
	end
end
