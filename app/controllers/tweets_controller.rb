class TweetsController < ApplicationController

  get '/tweets' do
    binding.pry
    erb :"views/index"
  end


end
