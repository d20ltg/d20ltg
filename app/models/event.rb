class Event < ActiveRecord::Base

  def tooltip_desc
    t_descrip = "#{event_time} - #{description}"
  end

  def self.upcoming
    events = self.where('event_day > ?', Date.today).order(:event_day).limit(5)
    events += RecurringEvent.upcoming
  end

end
