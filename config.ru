# config.ru

require './models/app'
require './models/tracking'
require './models/game'

run Sinatra::Application
