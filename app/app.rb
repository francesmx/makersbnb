ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'


class BnB < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

    register Sinatra::Flash

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
          if @user.save
            session[:user_id] = @user.id
            erb :'welcome'
          else
            flash.now[:errors] = ['Ooops, your password did not match - please try again']
            erb :'register'
          end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        erb :'sessions/welcome_back'
      else
        flash.now[:errors] = ['The email or password is incorrect']
        erb :'sessions/new'
      end
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/finalise' do
    @spaces = Space.all
    erb :'spaces/finalise'
  end

  post '/spaces/finalise' do
    #session[:name] = @spaces.name
    redirect '/spaces/finalise'
  end



  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:name],
                 description: params[:description],
                 price: params[:price],
                 available_from: params[:available_from],
                 available_to: params[:available_to],
                 user: current_user)
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

  get '/spaces/:id' do
    @space = Space.get(params[:id])
    erb :'space_listing'
  end

  post '/spaces/request' do
    Request.create(requested_date: params[:requested_date])
  end

  get '/spaces/request' do

  end

  post '/request/new' do

    session[:check_in] = Date.parse(params[:check_in])
    session[:check_out] = Date.parse(params[:check_in])
    session[:space_id] = params[:space_id]
    redirect '/request/finalise'
  end

  get '/requests' do
    @user = current_user
    erb :requests
  end

  get '/requests/:id' do
    # @request = Request.get(params[:id])
    erb :'request'
  end

  get '/request/finalise' do
    @check_in = session[:check_in]
    @check_out = session[:check_out]
    @space = Space.get(session[:space_id])
    erb :finalise
  end

  get '/request/confirmation' do
    request = Request.create(check_in: session[:check_in],
                  check_out: session[:check_out],
                  space: Space.get(session[:space_id]),
                  user: current_user)
    redirect '/requests'

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
