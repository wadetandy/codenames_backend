require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'rack/contrib'
require 'sorbet-runtime'
require 'pry'

require_relative 'graphql/schema'

SESSION_SECRET = "fcc2640a277d190ec0cfab6388d2ff58944176a00e178d9634aba1583feeb758"

class PartyGamesApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  set :session_secret, SESSION_SECRET
  set :protection,
    except: :json_csrf,
    origin_whitelist: ['http://localhost:3000']

  set :database_file, 'config/database.yml'
  use Rack::PostBodyContentTypeParser

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
      User.find_by(id: id)
    end
  end
end