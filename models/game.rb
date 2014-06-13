class Game < ActiveRecord::Base
  PUBLIC_URL = "http://mysite.com/"
  
  def to_ics
    event = Icalendar::Event.new
    event.dtstart = self.kickoff.localtime #.strftime("%Y%m%dT%H%M%S")
    event.dtend = self.end_date.localtime #.strftime("%Y%m%dT%H%M%S")
    event.summary = self.title
    event.description = self.title
    event.location = self.location
    event.ip_class = "PUBLIC"
    event.created = self.created_at
    event.last_modified = self.updated_at
    event.uid = event.url = "#{PUBLIC_URL}events/#{self.id}"
    #event.add_comment("my site is beautiful")
    event
  end
  
  def end_date
    self.kickoff + 105.minutes
  end
end
