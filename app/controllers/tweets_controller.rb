class TweetsController < ApplicationController

  get '/tweets' do
    
    erb :"views/index"
  end

end
