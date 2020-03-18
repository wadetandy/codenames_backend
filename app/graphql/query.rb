require 'graphql'
require_relative 'types/codenames_game'

require 'app/models/codenames_game'
require 'app/models/codenames_settings'

class QueryType < GraphQL::Schema::Object
  description "The query root of this schema"

  field :game, [GraphqlTypes::CodenamesGame], null: false do
    description 'Find a specific game instance by ID'
    argument :id, ID, required: true
  end

  field :games, [GraphqlTypes::CodenamesGame], null: false do
    description 'list games'
  end

  def game(id)
    Game.find(id)
  end

  def games
    Game.all
  end
end