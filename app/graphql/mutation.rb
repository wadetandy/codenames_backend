require 'graphql'

require_relative 'mutations/create_codenames_game'

class MutationType < GraphQL::Schema::Object
  description "The mutation root of this schema"

  field :createCodenamesGame, mutation: Mutations::CreateCodenamesGame
end