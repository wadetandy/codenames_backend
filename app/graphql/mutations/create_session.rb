require 'graphql'
require 'app/models/user'

module Mutations
  class CreateSession < GraphQL::Schema::Mutation
    description 'Creates user session'

    argument :nickname, String, required: true

    field :user_id, ID, null: false

    def resolve(nickname:)
      user = User.create!(name: nickname)

      session[:user_id] = user.id

      {
        user_id: user.id
      }
    end

    private

    def session
      context[:session]
    end
  end
end