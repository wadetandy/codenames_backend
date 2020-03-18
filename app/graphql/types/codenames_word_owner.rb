require_relative 'base_enum'

module GraphqlTypes
  class CodenamesWordOwner < BaseEnum
    value 'BLUE', 'Owned by the Blue Team', value: 'blue'
    value 'RED', 'Owned by the Red Team', value: 'red'
    value 'NEUTRAL', 'Unowned by either team', value: 'neutral'
    value 'ASSASSIN', 'The Assassin. When this card is revealed, the game ends', value: 'assassin'
    value 'UNKNOWN', 'Unrevealed card ownership', value: 'unknown'
  end
end