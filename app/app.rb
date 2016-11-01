ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/space'

class BnB < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'home'
  end

  get '/home' do
     erb :'register'
  end

  get '/register' do
    erb :'register'
  end

  post '/register' do
    erb :'welcome'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:name],
                 description: params[:description],
                 price: params[:price],
                 available_from: params[:available_from],
                 available_to: params[:available_to])
    redirect '/spaces'
  end

  post '/spaces/filter' do
    # session[:check_in] = params[:check_in]
    # session[:check_out] = params[:check_out]
    redirect '/spaces'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
