class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :cart_details
      t.string :total
      t.string :number
      t.string :stripe_token
      t.boolean :collected
      t.boolean :shiped

      t.timestamps
    end
  end
end
