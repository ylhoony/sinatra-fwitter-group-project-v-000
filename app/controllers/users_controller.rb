class UsersController < ApplicationController

  get '/signup' do
    erb :"users/signup"
  end

  post '/signup' do
    # binding.pry
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
    binding.pry

  end

end
