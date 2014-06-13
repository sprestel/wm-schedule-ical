# app.rb

require 'active_support/all'
require 'haml'

require 'sinatra'
require 'sinatra/activerecord'
require './environments'

require 'icalendar'

require './game'

set :haml, :format => :html5

get "/" do
  @start_time = Time.now.usec
  haml :index
#  "<a href='/calendar.ics'> as ICAL</a>"
end

get "/calendar.html" do
  @games = Game.all.order(:kickoff)
  haml :schedule
end

get "/calendar", :provides => 'html' do
  game = Game.order("updated_at DESC").first
  last_modified game.updated_at
  etag game
  if stale?(etag: game, last_modified: game.updated_at)
    @games = Game.all.order(:kickoff)
  end
  haml :schedule  
end

get "/calendar.ics", :provides => 'ics' do

  Tracking.create!(ip: request.ip, download_type: "ics") rescue nil

  cal = Icalendar::Calendar.new
  Game.all.each do |game|
    cal.add_event(game.to_ics)
  end
  cal.publish
  cal.to_ical
end

get "/calendar.rss", :provides => ['rss', 'atom', 'xml'] do
  Tracking.create!(ip: request.ip, download_type: "rss") rescue nil

  @games = Game.all.order(:kickoff)
  builder :feed
end
