class AddBooleansToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :vendor, :boolean
  end
end
