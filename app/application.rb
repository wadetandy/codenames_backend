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
  set :database_file, 'config/database.yml'
  use Rack::PostBodyContentTypeParser

  get '/' do
    erb :graphiql, locals: {
      api_path: '/graphql',
      page_title: 'Party Games API'
    }
  end

  post '/graphql' do
    result = PartyGamesAppSchema.execute(
      params[:query],
      variables: params[:variables],
      context: { current_user: nil },
    )
    json result
  end
end