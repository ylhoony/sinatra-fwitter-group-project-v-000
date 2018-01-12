class TweetsController < ApplicationController

  get '/tweets' do
    # binding.pry
    if logged_in?
      erb :"tweets/index"
    else
      redirect "/login"
    end
  end


end
