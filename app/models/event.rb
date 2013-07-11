class Event < ActiveRecord::Base
  attr_accessible :city, :date, :description, :state, :street_address, :street_address2, :title, :zip_code, :creator_id

  belongs_to :creator, class_name: "User", inverse_of: :created_events 
  has_and_belongs_to_many :users

  validates :city, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :street_address, presence: true
  validates :title, presence: true
  validates :zip_code, presence: true
end