class CreateUserStates < ActiveRecord::Migration
  def change
    create_table :user_state do |t|
      t.string :name

      t.timestamps
    end
  end
end
