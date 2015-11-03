class Event < ActiveRecord::Base
  def self.upcoming
    self.where('event_day > ?', Date.today).order(:event_day).limit(5)
  end

  def tooltip_desc
    t_descrip = self.description
    t_descrip << "\n"
    t_descrip << self.event_time
  end
end
