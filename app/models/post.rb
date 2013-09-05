class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title, :user, :role
  self.per_page = 10

  ROLES = %w[contact]
 
  def self.get_post_by_role(role)
  	post = Post.find_by_role(role)
  	if post.nil?
  		post = Post.first
  	end
  	post
  end

end
