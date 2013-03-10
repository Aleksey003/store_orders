class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.float :discount
			t.string  :logo
			t.boolean :get_news
			t.string :adress
			t.string  :phone
			t.integer :ban_days
			t.boolean :use_customers
			t.references :user_state
			t.references :user
      t.timestamps
    end
  end
end
