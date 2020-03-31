$LOAD_PATH << __dir__
require 'rack/cors'

# unless ENV['RACK_ENV'] == 'production'
  use Rack::Cors do
    allow do
      origins 'http://localhost:3000'
      resource '/graphql',
        headers: :any,
        methods: [:get, :post, :options],
        credentials: true
    end
  end
# end

require_relative './app/application'
run PartyGamesApp