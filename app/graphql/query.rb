require 'graphql'
require_relative 'types/codenames_game'

require 'app/models/codenames_game'

class QueryType < GraphQL::Schema::Object
  description "The query root of this schema"

  field :codenames_game, GraphqlTypes::CodenamesGame, null: false do
    description 'Find a specific game instance by ID'
    argument :id, ID, required: true
  end

  field :codenames_games, [GraphqlTypes::CodenamesGame], null: false do
    description 'list games'
  end

  def codenames_game(id:)
    CodenamesGame.find(id)
  end

  def codenames_games
    CodenamesGame.all
  end
end