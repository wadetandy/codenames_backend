require 'graphql'

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    def self.authorized?(object, context)
      super && context[:current_user].present?
    end

    private

    def session
      context[:session]
    end

    def current_user
      context[:current_user]
    end
  end
end