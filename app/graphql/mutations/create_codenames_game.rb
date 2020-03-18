require 'graphql'
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

      settings = CodenamesSettings.create(
        board_height: 5,
        board_width: 5,
        first_move: first_move,
        next_move: first_move,
        word_list: word_list,
        revealed: []
      )

      if settings.invalid?
        return {
          success: false,
          errors: settings.errors.full_messages
        }
      end

      game = CodenamesGame.create(settings: settings)

      if game.invalid?
        return {
          success: false,
          errors: game.errors.full_messages
        }
      end

      {
        success: true,
        errors: [],
        game: game.to_graphql
      }
    end
  end
end