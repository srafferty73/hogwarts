require( 'sinatra' )
require( 'sinatra/reloader' ) if development?
require( 'pry' )
require_relative('./models/hogwarts')
also_reload('./models/*')

get '/' do
 erb(:home)
end

#INDEX
get '/hogwarts-students' do
 #Go to the db and retrieve all the students
 @students = Hogwarts.all
 #Display a list of all the students
 erb(:index)
end
