module Codenames
  class WordOwner < T::Enum
    enums do
      Neutral = new
      Red = new
      Blue = new
      Assassin = new
    end
  end
end