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

      it 'redirects to users index page' do
        post :create, user: attributes_for(:user1)
        response.should redirect_to users_path
      end

      context 'with invalid attributes' do
        it 'does not create a new artist' do
          expect{
            post :create, user: attributes_for(:invalid_user)
          }.to change{User.count}.by(0)
        end
        it 're-renders the :new view' do
          post :create, user: attributes_for(:invalid_user)
          response.should render_template :new
        end
      end
    end
  end


  describe 'member' do
    let!(:user) {create(:user1)}

    describe 'GET #edit' do
      before {get :edit, id: user}
      it 'assigns the given user to an instance variable' do
        assigns(:user).should eq user
      end
      it 'renders the :edit view' do
        response.should render_template :edit
      end
      describe 'GET #show' do
        before {get :show, id: user }
        it 'assigns the given user to an instance variable' do
          assigns(:user).should eq user
        end
        it 'renders the :show view' do
          response.should render_template :show
        end
      end
    end

    describe "PUT #update" do
      context 'valid attributes' do
        let(:updated_user) {build(:updated_user)}
        it 'assigns the given user to an instance variable' do
          put :update, id: user, user: attributes_for(:updated_user)
          assigns(:user).should eq user
        end
        it 'changes the attributes of the user' do
          original_name = user.name
          put :update, id: user, user: attributes_for(:updated_user)

          user.reload

          user.name.should eq updated_user.name
          user.name.should_not eq original_name
        end
        it "redirects to the user page" do
          put :update, id: user, user: attributes_for(:updated_user)
          response.should redirect_to users_path(user)
        end
      end
      context 'invalid attributes' do
        it 'assigns the given user to an instance variable do' do
          put :update, id: user, user: attributes_for(:invalid_user)
          assigns(:user).should eq user 
        end
        it 'does not change the attributes of the user' do
          original_name = user.name 
          original_email = user.email 
          put :update, id: user, user: attributes_for(:invalid_user)

          user.reload 

          user.name.should eq original_name
          user.name.should_not be_nil
          user.email.should eq original_email
          user.email.should_not be_nil
        end
        it 're-renders the edit page' do
          put :update, id: user, user: attributes_for(:invalid_user)
          response.should render_template :edit
        end
      end
    end

    describe 'Delete #destroy' do
      it 'assigns the given user to an instance variable' do
        delete :destroy, id: user
        assigns(:user).should eq user
      end
      it 'deletes the user' do
        expect {
          delete :destroy, id: user
        }.to change {User.count}.by(-1)
      end
      it 'redirects to the user index page' do
        delete :destroy, id: user
        response.should redirect_to users_path 
      end
    end
  end
end
