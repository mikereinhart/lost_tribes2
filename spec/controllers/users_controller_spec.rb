require 'spec_helper'

describe UsersController do 
  subject {UsersController}
  it {should < ApplicationController}


  describe 'collection' do 
    describe 'GET #index' do
      it 'assigns all users to an instance variable' do
        user = create(:user1)
        user2 = create(:vendor)
        get :index
        assigns(:users).should eq [user, user2]
      end
    end

    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end

  describe 'Get #new' do
    it 'assigns a new user to an instance variable' do 
      get :new 
      assigns(:user).should be_an_instance_of(User)
      assigns(:user).should be_new_record
    end
    it 'render the :new view' do
      get :new
      response.should render_template :new
    end
  end

  describe 'Post #create' do
    context 'with valid attributes' do

      it 'creates a new user' do
        expect {
          post :create, user: attributes_for(:user1)
        }.to change{User.count}.by(1)
      end

    end
  end






  
end
