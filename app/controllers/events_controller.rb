class EventsController < ApplicationController 
  
  def index
  @events = Event.order(:title)
  respond_to do |format|
    format.html
    format.csv { send_data @events.to_csv }
    format.xls { send_data @events.to_csv(col_sep: "\t") }
  end
end

  def create
    # binding.pry
    # @events = Event.all
    @event = Event.new(params[:event])
    # @event.save!
    # render json: {event: @event}

    if @event.save
      @events = Event.all
      respond_to do |format|
        format.js 
      end
    else
      render :new
    end
  end

   def new
    @events = Event.all
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event]) 
      redirect_to event_path(@event)
    else
      render :edit
      # redirect_to edit_events_path 
    end
  end
  
  def destroy
    event = Event.find(params[:id])
    event.destroy
    render json: event
  end

end 


