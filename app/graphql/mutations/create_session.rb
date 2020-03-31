require 'graphql'
require 'app/models/user'
require_relative '../types/user'

module Mutations
  class CreateSession < GraphQL::Schema::Mutation
    description 'Creates user session'

    argument :nickname, String, required: true

    field :user, GraphqlTypes::User, null: false

    def resolve(nickname:)
      user = User.create!(name: nickname)

      session[:user_id] = user.id

      {
        user: user
      }
    end

    private

    def session
      context.session
    end
  end
end