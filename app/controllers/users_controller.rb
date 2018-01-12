class UsersController < ApplicationController

  get '/signup' do
    erb :"users/signup"
  end

  post '/signup' do
    redirect "/tweets" if logged_in?
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect "/signup"
    else
      user = User.create(params)
      redirect "/tweets"
    end
  end

  get '/login' do
    erb :"users/login"
  end

  post '/login' do
    user = User.find_by(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/tweets'
    else
      redirect '/login'
    end
  end

  post '/logout' do
    session.delete
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
