class EventsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :requires_admin, :only => [:new, :edit, :create, :update]

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
    @store = Store.first
  end

  def index
    @events = Event.all
    @events_by_date = @events.group_by(&:event_day)
    @recurring_events = RecurringEvent.all.group_by(&:day)
    @upcoming_events = Event.upcoming
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def upcoming
    @upcoming_events = Event.upcoming
    render :partial=>'upcoming'
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path
  end

  private

    def event_params
      params.require(:event).permit!
    end
end
