ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

class BnB < Sinatra::Base


  get '/' do
    'Hello BnB!'
  end

  get '/spaces' do
    erb :'spaces/availability'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    redirect '/spaces'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
