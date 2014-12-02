class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.text :address
      t.string :phone
      t.string :auth_token

      t.timestamps
    end
  end
end
