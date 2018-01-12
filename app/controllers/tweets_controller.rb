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
    if logged_in?
      erb :"tweets/new"
    else
      redirect "/login"
    end
  end

  post '/tweets' do
    if !params[:content].empty?
      @tweet = Tweet.create(params)
      @tweet.user = User.find(session[:user_id])
      @tweet.save
      redirect "/tweets"
    else
      redirect "/tweets/new"
    end
  end

  get '/tweets/:id' do
    erb :"tweets/show"
  end


end
