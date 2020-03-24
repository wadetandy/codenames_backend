require 'graphql'

require_relative 'mutations/create_codenames_game'
require_relative 'mutations/create_session'

class MutationType < GraphQL::Schema::Object
  description "The mutation root of this schema"

  field :create_codenames_game, mutation: Mutations::CreateCodenamesGame
  field :create_session, mutation: Mutations::CreateSession
end