require_relative 'word_owner'

module Codenames
  class Word < T::Struct
    const :word, String
    const :owner, WordOwner
    prop :revealed, T::Boolean, default: false
  end
end