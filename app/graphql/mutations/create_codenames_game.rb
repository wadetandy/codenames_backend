require 'graphql'
require 'app/models/user'
require 'app/models/team'
require 'app/models/codenames_game'
require 'lib/codenames/word_list_factory'
require_relative 'base_mutation'
require_relative 'concerns/has_status'

module Mutations
  class CreateCodenamesGame < Mutations::BaseMutation
    description 'Creates a new game of Codenames'

    include HasStatus
    field :game, GraphqlTypes::CodenamesGame, null: true

    def resolve()
      first_move = [Codenames::WordOwner::Blue, Codenames::WordOwner::Red].sample

      word_list = Codenames::WordListFactory.new.build_word_list(first_move: first_move)

      red_team = Team.create!(name: 'Red', users: [current_user])
      blue_team = Team.create!(name: 'Blue')

      game = CodenamesGame.create(
        board_height: 5,
        board_width: 5,
        first_move: first_move,
        next_move: first_move,
        word_list: word_list,
        admin: current_user,
        red_team: red_team,
        blue_team: blue_team,
        users: [current_user]
      )

      if game.invalid?
        return {
          success: false,
          errors: game.errors.full_messages
        }
      end

      {
        success: true,
        errors: [],
        game: game
      }
    end
  end
end