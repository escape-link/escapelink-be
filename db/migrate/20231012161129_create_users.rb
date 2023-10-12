class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :nickname
      t.text :email
      t.text :password_digest
      t.timestamps
    end
  end
end
