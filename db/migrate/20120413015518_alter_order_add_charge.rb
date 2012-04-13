class AlterOrderAddCharge < ActiveRecord::Migration
  def change
    add_column :orders, :charge, :text
  end
end
