class AddVendorToUser < ActiveRecord::Migration
  def change
    add_column :users, :street_address, :string
    add_column :users, :street_address_2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string 
    add_column :users, :phone_number, :string
  end
end
