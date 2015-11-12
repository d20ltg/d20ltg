class RecurringEvent < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :day

  def display_day
    day.nil? ? 'None' : Date::DAYNAMES[day]
  end

  default_scope { order(:day, :event_time) }

  def tooltip_desc
    t_descrip = self.description
    t_descrip << "\n"
    t_descrip << self.event_time
  end
end
