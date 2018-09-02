require 'sinatra/base'
require './lib/peep.rb'

class ChitterChallenge < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    peep = params[:peep_input]
    Peep.create(peep)
    redirect '/peeps'
  end

end