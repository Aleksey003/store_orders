class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.float :discount
			t.references :user
      t.timestamps
    end
  end
end
