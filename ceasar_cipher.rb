require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :index
end

post '/' do
  erb :index
end
