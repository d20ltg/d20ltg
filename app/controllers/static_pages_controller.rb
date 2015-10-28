class StaticPagesController < ApplicationController
  def home
    @events = Event.where('event_day > ?', Date.today).order(:event_day).limit(5)
  end

  def about
  end

  def contact
  end

  def magic
  end

  def tabletop
  end

  def comics
  end

  def calendar
  end

  def login
  end

  def gatherer
  end

end
