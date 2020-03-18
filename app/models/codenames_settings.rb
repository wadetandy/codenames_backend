require_relative 'application_record'
require_relative 'types/codenames_word_list'
require_relative 'types/sorbet_enum'

class CodenamesSettings < ApplicationRecord
  attribute :word_list, Types::CodenamesWordList.new, array: true
  attribute :first_move, Types::SorbetEnum.new(Codenames::WordOwner)
  attribute :next_move, Types::SorbetEnum.new(Codenames::WordOwner)

  has_one :game, class_name: 'CodenamesGame', foreign_key: :settings_id

  validates :board_height, presence: true
  validates :board_width, presence: true
  validates :first_move, presence: true
end