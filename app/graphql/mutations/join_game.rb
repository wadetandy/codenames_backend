require 'graphql'
require 'app/models/user'
require_relative '../types/user'

module Mutations
  class JoinGame < BaseMutation
    description 'Joins a game'

    argument :game_id, ID, required: true

    include HasStatus
    field :game, GraphqlTypes::CodenamesGame, null: true

    def resolve(game_id:)
      unless (game = CodenamesGame.find_by(id: game_id))
        return {
          success: false,
          messages: [
            "Could not find game with id #{game_id}"
          ]
        }
      end

      unless game.users.find_by(id: current_user.id)
        Team.where(id: [game.red_team_id, game.blue_team_id]).include.sort_by(&:count)

        # game.users << current_user

      end

      {
        success: true,
        messages: [],
        game: game
      }
    end
  end
end