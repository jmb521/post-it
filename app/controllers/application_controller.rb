require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'mynameisbob'
  end

  get "/" do
    erb :welcome
  end

  get '/login' do
    erb :login
  end

  get '/signup' do
    erb :signup
  end

  post '/login' do

    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/post_its'
    else
      @username = params[:username]
      erb :login
    end
  end

  post '/signup' do

    @user = User.new(:username => params[:username], password: params["password"], email: params[:email])
    if @user.save
      session[:user_id] = @user.id
      redirect '/post_its'
    else
      redirect '/signup'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  helpers do
    def current_user
      User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def not_logged_in?
      if !logged_in?
        redirect '/'
    
      end
    end
  end



end
