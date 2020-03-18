require 'graphql'
require_relative 'query'
require_relative 'mutation'

class PartyGamesAppSchema < GraphQL::Schema
  query QueryType
  mutation MutationType
end