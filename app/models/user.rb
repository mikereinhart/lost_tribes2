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
  validate :vendor_address # or validate? 

  def vendor_address
    if self.vendor? && self.street_address.nil?
      self.errors.add(:street_address, 'Street Address is required for vendors.')
    end

    if self.vendor? && self.city.nil?
      self.errors.add(:city, 'City is a required field for vendors.')
    end 

    if self.vendor? && self.state.nil?
      self.errors.add(:state, 'State is a required field.')
    end

    if self.vendor? && self.phone_number.nil?
      self.errors.add(:phone_number, "Phone number is a required field.")
    end


  end



end
