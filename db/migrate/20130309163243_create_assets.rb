class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :caption
      t.references :product
	  t.attachment :data
      t.timestamps
    end
    add_index :assets, :product_id
  end
end
