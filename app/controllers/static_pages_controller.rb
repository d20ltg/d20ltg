class StaticPagesController < ApplicationController
  def home
    @announcements = Announcement.all
    @upcoming_events = Event.upcoming
    @time = Time.now.getlocal "-06:00"
    # add an hour if DST
    if TZInfo::Timezone.get('America/Chicago').current_period.dst?
      @time = @time + 3600
    end

    # store hours: 10am to 8pm
    @open_now = (@time.hour >= 10) and (@time.hour < 20)
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
