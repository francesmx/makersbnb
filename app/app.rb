require 'sinatra/base'

class BnB < Sinatra::Base
  get '/' do
    'Hello BnB!'
  end

  get '/spaces' do
    #need to create @properties
    erb :'spaces'
  end

  post '/spaces/filer' do
    # session[:check_in] = params[:check_in]
    # session[:check_out] = params[:check_out]
    redirect '/spaces'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
