require 'spec_helper'

describe User do
 subject(:user1) {create(:user1)}

 #{User.create(name: 'Ryan', email: 'ryan@gmail.com', zip: 44122)}

  describe 'validations' do
    it {should validate_presence_of(:zip)}
  context "Vendors"
    it "requires vendors to have street address" do
      vendor = create(:vendor)
      expect(vendor).to be_valid
      vendor.street_address = nil 
      expect(vendor).to be_invalid
    end
    it "vendors should have city" do 
      vendor = create(:vendor)
      vendor.city = nil
      expect(vendor).to be_invalid
    end
    it "vendors should have a state" do
      vendor = create(:vendor)
      vendor.state = nil
      expect(vendor).to be_invalid 
    end
    it "vendors must have a phone number" do
      vendor = create(:vendor)
      vendor.phone_number = nil
      expect(vendor).to be_invalid
    end
  context "Users" do 
    it "users do not require street address" do
      subject.street_address = nil
      expect(subject).to be_valid
    end
    it "users do not require city" do
      subject.city = nil
      expect(subject).to be_valid
    end
    it "users do not require a state" do
      subject.state = nil
      expect(subject).to be_valid
    end
    it "users do not require phone number" do
      subject.phone_number = nil
      expect(subject).to be_valid
    end
    it "users should require a zip" do
      subject.zip = nil
      expect(subject).to be_invalid
    end
  end



  end
end