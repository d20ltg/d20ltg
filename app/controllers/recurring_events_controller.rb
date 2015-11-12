class RecurringEventsController < ApplicationController
  def new
    @event = RecurringEvent.new
  end

  def edit
    @event = RecurringEvent.find(params[:id])
  end

  def create
    @event = RecurringEvent.new(event_params)
    @event.day = params[:day].to_i
    @event.save
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

  def destroy
    if @event = RecurringEvent.find(params[:id])
      @event.destroy
      redirect_to recurring_events_path
    end
  end

  def index
    @events = RecurringEvent.all
  end

  private

    def event_params
      params.require(:recurring_event).permit!
    end
end
