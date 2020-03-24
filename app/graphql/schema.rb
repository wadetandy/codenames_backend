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
    puts err.inspect
    raise GraphQL::ExecutionError, "#{err.message}\n#{err.backtrace.join("\n")}"
  end

  def self.unauthorized_object(error)
    # Add a top-level error to the response instead of returning nil:
    raise GraphQL::ExecutionError, "You must be authenticated to access #{error.field.name}"
  end
end