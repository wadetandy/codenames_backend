require_relative './application_record'
require_relative './team_membership'

class User < ApplicationRecord
  has_many :team_memberships
  has_many :teams, through: :team_memberships
end