ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/space'
require_relative 'models/user'

class BnB < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

  get '/' do
    erb :'home'
  end

  get '/home' do
     erb :'register'
  end

  get '/register' do
    @user = User.new
    erb :'register'
  end

  post '/register' do
    @user = User.new(email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation])
    erb :'welcome'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
      #user = User.authenticate(params[:email], params[:password])
      #if / else statement required to verify data
    erb :'sessions/welcome_back'
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

  get '/spaces/filter_dates' do
    @spaces = Space.search_availability(session[:available_from], session[:available_to])
    erb :spaces
  end

  post '/spaces/filter_dates' do
    session[:available_from] = Date.parse(params[:available_from])
    session[:available_to] = Date.parse(params[:available_to])
    redirect '/spaces/filter_dates'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
