require_relative './application_record'

class Team < ApplicationRecord
  has_one :codenames_game
  has_and_belongs_to_many :users
end