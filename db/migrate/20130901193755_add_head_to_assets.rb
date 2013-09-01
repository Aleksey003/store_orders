class AddHeadToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :head, :boolean
  end
end
