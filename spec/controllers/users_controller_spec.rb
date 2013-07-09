require 'spec_helper'

describe UsersController do
  login_user
  describe 'GET #index' do
    it 'saves each user as an instance variable' do
      user2 = create(:user2)
      get :index
      assigns(:users).should eq [@user1, user2]

    end
  end
end


