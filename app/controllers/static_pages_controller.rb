class StaticPagesController < ApplicationController
  def home
    @announcements = Announcement.all
    @upcoming_events = Event.upcoming
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
