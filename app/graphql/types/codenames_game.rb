require_relative 'base_object'
require_relative 'codenames_word'
require_relative 'codenames_team'

class GraphqlTypes::CodenamesGame < GraphqlTypes::BaseObject
  description 'A specific playthrough of a game of codenames'

  field :id, ID, null: false
  field :word_list, [GraphqlTypes::CodenamesWord], null: false
  field :first_move, GraphqlTypes::CodenamesTeam, null: false
  field :next_move, GraphqlTypes::CodenamesTeam, null: false
end