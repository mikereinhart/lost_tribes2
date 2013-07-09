require 'spec_helper'

describe User do
  subject(:user1) { build(:user1) }

  describe 'validations' do
    describe 'email validations' do
      it { should_not allow_value("blah").for(:email) }
      it { should allow_value("a@b.com").for(:email) }
      it { should validate_uniqueness_of(:email) }
    end

    describe 'password validations' do
      it { should allow_value("password").for(:encrypted_password) }
      it { should validate_presence_of(:encrypted_password) }
    end
  end

end