require_relative '../codenames/word'

module Types
  class CodenamesWordList < ActiveRecord::Type::Json
    def deserialize(value)
      if (val = super)
        Array(val).map do |v|
          if v.kind_of?(Codenames::Word)
            v
          else
            Codenames::Word.new(
              word: v['word'],
              owner: Codenames::WordOwner.deserialize(v['owner']),
              revealed: v['revealed']
            )
          end
        end
      end
    end

    def serialize(value)
      super(
        value.map {|v|
          {
            word: v.word,
            owner: v.owner.serialize,
            revealed: v.revealed
          }
        }
      )
    end

    def cast(value)
      deserialize(value)
    end
  end
end