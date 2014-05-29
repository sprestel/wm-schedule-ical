# app.rb

require 'active_support/all'
require 'haml'

require 'sinatra'
require 'sinatra/activerecord'
require './environments'

require 'icalendar'

set :haml, :format => :html5

get "/" do
  haml :index
#  "<a href='/calendar.ics'> as ICAL</a>"
end

get "/calendar.html" do
  @games = Game.all.order(:kickoff)
  haml :schedule
end

get "/calendar", :provides => 'html' do
  @games = Game.all.order(:kickoff)
  haml :schedule  
end

get "/calendar.ics", :provides => 'ics' do
  cal = Icalendar::Calendar.new
  Game.all.each do |game|
    cal.add_event(game.to_ics)
  end
  cal.publish
  cal.to_ical
end

get "/calendar.rss", :provides => ['rss', 'atom', 'xml'] do
  # cal = Icalendar::Calendar.new
  # Game.all.each do |game|
  #   cal.add_event(game.to_ics)
  # end
  # cal.publish
  # cal.to_ical
  @games = Game.all.order(:kickoff)
  builder :feed
end

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