class TweetsController < ApplicationController

  get '/tweets' do
    # binding.pry
    if logged_in?
      @current_user = current_user
      erb :"tweets/index"
    else
      redirect "/login"
    end
  end

  get '/tweets/new' do
    erb :"tweets/new"
  end

  post '/tweets' do
    # binding.pry
    if logged_in?
      if !params[:content].empty?
        @tweet = Tweet.create(params)
        @tweet.user = User.find(session[:user_id])
        @tweet.save
        redirect "/tweets"
      else
        redirect "/tweets/new"
      end
    else
      redirect "/login"
    end
  end


end
