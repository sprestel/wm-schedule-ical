# config.ru

require './app'
require './models/tracking'
require './models/game'

run Sinatra::Application
