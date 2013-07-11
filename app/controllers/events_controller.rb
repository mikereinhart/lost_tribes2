class EventsController < ApplicationController 

  def index
    @events = Event.all
  end
#   def index
#   @events = Event.order(:title)
#   respond_to do |format|
#     format.html
#     format.csv { send_data @events.to_csv }
#     format.xls { send_data @events.to_csv(col_sep: "\t") }
#   end
# end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_path
    else
      redirect_to new_event_path
    end
  end

   def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    if event.update_attributes(params[:event])
      redirect_to events_path
    else
      redirect_to edit_events_path 
    end
  end
  
  def destroy
    Event.find(params[:id]).delete
    redirect_to events_path
  end

end 

