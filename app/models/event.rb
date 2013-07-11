class Event < ActiveRecord::Base
  attr_accessible :city, :date, :description, :state, :street_address, :street_address2, :title, :zip_code, :created_at, :updated_at


end
