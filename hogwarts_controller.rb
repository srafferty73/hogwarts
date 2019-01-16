require( 'sinatra' )
require( 'sinatra/reloader' ) if development?
require( 'pry' )
require_relative('./models/hogwarts')
also_reload('./models/*')

get '/' do
 erb(:home)
end
