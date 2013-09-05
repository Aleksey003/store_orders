class AddRoleToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :role, :string
  end
end
