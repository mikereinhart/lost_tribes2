class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.string :description
      t.string :street_address
      t.string :street_address2
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
