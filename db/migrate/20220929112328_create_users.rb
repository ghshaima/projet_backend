class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :Firstname
      t.string :Lastname
      t.string :Adress
      t.string :Password
      t.string :Email

      t.timestamps
    end
  end
end
