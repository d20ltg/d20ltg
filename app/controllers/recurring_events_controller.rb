class RecurringEventsController < ApplicationController
  def new
    @event = RecurringEvent.new
  end

  def edit
    @event = RecurringEvent.find(params[:id])
  end

  def create
    @event = RecurringEvent.create(event_params)
    redirect_to recurring_events_path
  end

  def update
    @event = RecurringEvent.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to recurring_events_path
    end
  end

  def show
    @event = RecurringEvent.find(params[:id])
    @store = Store.first
  end

  def delete
  end

  def index
    @events = RecurringEvent.all
  end

  private

    def event_params
      params.require(:event).permit!
    end
end
