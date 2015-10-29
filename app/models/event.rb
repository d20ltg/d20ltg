class Event < ActiveRecord::Base
  def self.upcoming
    self.where('event_day > ?', Date.today).order(:event_day).limit(5)
  end
end
