ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

class BnB < Sinatra::Base


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
    erb :'spaces'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
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
