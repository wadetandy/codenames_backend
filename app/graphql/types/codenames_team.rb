require_relative 'base_enum'

module GraphqlTypes
  class CodenamesTeam < BaseEnum
    value 'BLUE', 'Owned by the Blue Team', value: 'blue'
    value 'RED', 'Owned by the Red Team', value: 'red'
  end
end