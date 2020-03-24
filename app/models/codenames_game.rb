require_relative 'application_record'
require_relative 'types/codenames_word_list'
require_relative 'types/sorbet_enum'

class CodenamesGame < ApplicationRecord
  attribute :word_list, Types::CodenamesWordList.new, array: true
  attribute :first_move, Types::SorbetEnum.new(Codenames::WordOwner)
  attribute :next_move, Types::SorbetEnum.new(Codenames::WordOwner)

  belongs_to :red_team, class_name: 'Team'
  belongs_to :blue_team, class_name: 'Team'
  belongs_to :admin, class_name: 'User'

  validates :board_height, presence: true
  validates :board_width, presence: true
  validates :first_move, presence: true
end