class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.create(event_params)
    redirect_to events_path
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to events_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
    @events_by_date = @events.group_by(&:event_day)
    @upcoming_events = Event.upcoming
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def upcoming
    @upcoming_events = Event.upcoming
    render :partial=>'upcoming'
  end

  private

    def event_params
      params.require(:event).permit!
    end
end
