require 'spec_helper'

describe EventsController do
  let(:event) { create(:event1) }

  describe 'GET #index' do
    it 'saves each event as an instance variable' do
      event1 = create(:event1)
      event2 = create(:event2)
      get :index
      assigns(:events).should eq [event1, event2]
    end
    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end

  describe 'POST #create' do
    subject(:event) {create(:event1)}
    context ' when save succeeds' do
      # event1 = Event.new
      it 'saves the event' do
        event.should_receive(:save)
        event.save
        post :create
      end
    end
    # context 'when save fails' do
    #     it 'renders new page' do
    #       # subject(:event)
    #       event.should_receive(:save).and_return(false)
    #       post :create
    #       response.should render_template 'new'

    #       # let(:event) { build(:invalid_event) } #Refactor this out
    #       # it 'does not create a new event'
    #       # it 're-renders the :new view'
    #     end
    #   end
  end

  describe 'GET #new' do
    it 'describes a new event as an instance variable' do
      get :new
      assigns(:event).should be_an_instance_of(Event)
      assigns(:event).should be_new_record
    end
    it 'renders the :new view' do
      get :new
      response.should render_template :new
    end
  end

  describe 'GET #edit' do
    subject(:event) {create(:event1)}
    before { get :edit, id: event }
    it 'assigns the given event to an instance variable' do
      assigns(:event).should eq event
    end
    it 'renders the :edit view' do
      response.should render_template :edit
    end
  end


  describe 'GET #show' do
    subject(:event) {create(:event1)}
    before { get :show, id: event }
    it 'assigns the given event to an instance variable' do
      # event = Factory(:event1)
      assigns(:event).should eq event
    end
  end
  # subject(:event) {create(:event1)}
  # before { get :edit, id: event }

  # it { should render_template(:show)  }
  # get :show, id: event



  describe 'PUT #update' do
    context 'valid attributes' do
      let(:updated_event) {build(:updated_event)}
      it 'assigns the given event to an instance variable' do
        put :update, id: event, event: attributes_for(:event1)
          assigns(:updated_event1).should eq :event1

      end
    end
    
  end
















  describe 'DELETE #destroy' do
    # subject(:event) {create(:event1)}
    it 'deletes the event' do
      event.reload
      expect {
        delete :destroy, id: event
      }.to change{Event.count}.by -1
    end
    it 'redirects to the events index page' do
      delete :destroy, id: event
      response.should redirect_to events_path
    end
  end


end

# it { should permit(:title, :body).for(:create) }
