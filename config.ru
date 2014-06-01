# config.ru

require './app'
require './tracking'
require './game'

run Sinatra::Application
