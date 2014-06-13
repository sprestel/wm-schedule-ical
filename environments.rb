require 'active_support/all'

I18n.enforce_available_locales = true

require './app'
require './tracking'
require './game'

configure :development do
 set :database, 'sqlite3:name.db'
 set :show_exceptions, true
end

configure :production do
 db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/wm_2014')

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end