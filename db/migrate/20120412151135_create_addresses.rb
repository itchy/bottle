class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zipcode
            
      t.timestamps
    end
  end
end
