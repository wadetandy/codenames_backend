require_relative './application_record'

class TeamMembership < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :team, class_name: 'Team'
end