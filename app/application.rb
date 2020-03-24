require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'rack/contrib'
require 'sorbet-runtime'
require 'pry'

require_relative 'graphql/schema'

class PartyGamesApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  set :database_file, 'config/database.yml'
  use Rack::PostBodyContentTypeParser
  set :protection, :except => :json_csrf

  get '/' do
    erb :graphiql, locals: {
      api_path: '/graphql',
      page_title: 'Party Games API'
    }
  end

  post '/graphql' do
    context = {
      # we need to provide session and current user
      session: session,
      current_user: current_user
    }
    result = PartyGamesAppSchema.execute(
      params[:query],
      variables: params[:variables],
      context: context,
    )
    json result
  end

  private

  def current_user
    if (id = session[:user_id])
      User.find(id)
    end
  end
end