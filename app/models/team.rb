require_relative './application_record'
require_relative './team_membership'

class Team < ApplicationRecord
  has_one :codenames_game
  has_many :team_memberships
  has_many :users, through: :team_memberships

  before_save do
    self.users_count = user_ids.count
  end
end