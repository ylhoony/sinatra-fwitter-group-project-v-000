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


end
