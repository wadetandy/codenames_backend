require_relative 'base_object'
require_relative 'codenames_word_owner'

class GraphqlTypes::CodenamesWord < GraphqlTypes::BaseObject
  description 'A specific card in a game of codenames'

  field :word, String, null: false
  field :owner, GraphqlTypes::CodenamesWordOwner, null: false

  def owner
    if object.revealed
      object.owner.serialize
    else
      'unknown'
    end
  end
end