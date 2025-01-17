require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/' do
    @all_peeps = Peep.all
    erb(:home)
  end

  post '/' do
    Peep.create(params[:message])
    redirect("/")
  end


  run! if app_file == $0
end
