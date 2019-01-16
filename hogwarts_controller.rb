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

#NEW
get '/hogwarts-students/new' do
 erb(:new)
end
#CREATE
post '/hogwarts-students' do
 # Create a new student object
 Hogwarts.new( params ).save
 # Save to the db
 # Redirect the browser to '/hogwarts-students'
 redirect to './hogwarts-students'
end
