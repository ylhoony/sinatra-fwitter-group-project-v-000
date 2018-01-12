class TweetsController < ApplicationController

  get '/tweets' do
    binding.pry
    erb :"views/index"
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
