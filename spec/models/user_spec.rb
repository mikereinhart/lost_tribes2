require 'spec_helper'

describe User do
 # subject(:user1) {create(:user1)}#{User.create(name: 'Ryan', email: 'ryan@gmail.com', zip: 44122)}

  describe 'validations' do
      it {should validate_presence_of(:zip)}
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:events) }
  end
end

