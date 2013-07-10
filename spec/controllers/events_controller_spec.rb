require 'spec_helper'

describe EventsController do

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

    #       # let(:artist) { build(:invalid_artist) } #Refactor this out
    #       # it 'does not create a new artist'
    #       # it 're-renders the :new view'
    #     end
    #   end
  end

  describe 'GET #new' do
    it 'describes a new artist as an instance variable' do
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
    it 'assigns the given artist to an instance variable' do
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

  end






  describe 'DELETE #destroy' do
      #before do... what?
      it 'deletes the event'
      it 'redirects to the events index page'
    end


end

# it { should permit(:title, :body).for(:create) }


# describe 'collection' do
#     describe 'GET #index' do
#       it 'assigns all artists to an instance variable' do
#         artist = create(:artist)
#         artist2 = create(:artist2)
#         get :index
#         assigns(:artists).should eq [artist, artist2]
#       end

#       it 'renders the :index view' do
#         get :index
#         response.should render_template :index
#       end
#     end

#     describe 'GET #new' do
#       let(:artist) { mock_model(Artist).as_new_record }

#       before do
#         Artist.stub(:new).and_return(artist)
#       end

#       it 'assigns a new artist to an instance variable' do
#         get :new
#         assigns(:artist).should be_an_instance_of(Artist)
#         assigns(:artist).should be_new_record
#       end
#       it 'renders the :new view' do
#         get :new
#         response.should render_template :new
#       end

#       describe 'POST #create' do
#         let(:artist) {mock_model(Artist).as_null_object}  #so it ignores all message calls called on it without properly being told.. so no error calls.
#         ## instead of using a facory to buiild a model. Use this rspec ruby method
#         before do
#           Artist.stub(:new).and_return(artist)
#         end
#       end
#       context ' when save succeeds' do
#         it 'saves the artist' do
#           artist.should_receive(:save)   #if no one calls it it will fail
#           post :create
#         end

#         it 'redirects to artists index page' do
#           post :create
#           response.should redirect_to artists_path
#         end
