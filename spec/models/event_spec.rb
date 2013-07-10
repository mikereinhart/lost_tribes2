require 'spec_helper'

describe Event do
  
  describe 'validations' do
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:street_address)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:zip_code)}
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:users) }
  end
end
