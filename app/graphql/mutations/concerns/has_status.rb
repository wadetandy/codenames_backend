module Mutations
  module HasStatus
    extend ActiveSupport::Concern

    included do
      field :success, GraphQL::Types::Boolean, null: false
      field :errors, [String], null: false
    end
  end
end