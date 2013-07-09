class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, 
  :zip, :street_address, :street_address2, :city, :state, :phone_number, :vendor, :admin 
  # attr_accessible :title, :body

  validates :zip, presence: true, length: { :is => 5 } 


end
