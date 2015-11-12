class RecurringEvent < ActiveRecord::Base
  def display_day
    Date::DAYNAMES[day]
  end

  default_scope { order(:day, :event_time) }
end
