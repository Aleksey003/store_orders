class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title, :user
  self.per_page = 10
end
