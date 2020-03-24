$LOAD_PATH << __dir__
require 'rack/cors'

# unless ENV['RACK_ENV'] == 'production'
  use Rack::Cors do
    allow do
      origins '*'
      resource '*', headers: :any, methods: [:get, :post, :options]
    end
  end
# end

require_relative './app/application'
run PartyGamesApp