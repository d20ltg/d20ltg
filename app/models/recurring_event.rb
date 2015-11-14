class RecurringEvent < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :day

  def display_day
    day.nil? ? 'None' : Date::DAYNAMES[day]
  end

  default_scope { order(:day, :event_time) }

  def tooltip_desc
    t_descrip = "#{event_time} - #{description}"
  end

  def event
    Event.new(
      title: title,
      description: description,
      event_type: event_type,
      event_time: event_time
    )
  end

  def self.upcoming
    today = Date.today.wday
    upcoming = self.all.group_by(&:day)
    events = Array.new

    (0..6).each do |i|
      day = (today + i) % 7
      date = Date.today + i
      if upcoming[day]
        upcoming[day].each do |event|
          new_event = event.event
          new_event.event_day = date
          events << new_event
        end
      end
    end

    events
  end

end
