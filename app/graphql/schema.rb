require 'graphql'
require_relative 'query'
require_relative 'mutation'

class PartyGamesAppSchema < GraphQL::Schema
  query QueryType
  mutation MutationType

  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST
  use GraphQL::Execution::Errors

  rescue_from(ActiveRecord::RecordNotFound) do |err, obj, args, ctx, field|
    raise GraphQL::ExecutionError, "#{field.type.unwrap.graphql_name} not found"
  end

  rescue_from(StandardError) do |err, obj, args, ctx, field|
    raise GraphQL::ExecutionError, "#{err.message}\n#{err.backtrace.join("\n")}"
  end
end