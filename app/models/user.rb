require_relative './application_record'

class User < ApplicationRecord
  has_and_belongs_to_many :teams
end