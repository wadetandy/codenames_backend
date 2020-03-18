require_relative 'game'

class CodenamesGame < Game
  belongs_to :settings, class_name: 'CodenamesSettings'

  def to_graphql
    {
      id: id,
      word_list: settings.word_list.each_with_index.map do|w, idx|
        revealed = (settings.revealed || []).include?(idx)
        {
          word: w.word,
          owner: revealed ? w.owner.serialize : 'unknown'
        }
      end,
      first_move: settings.first_move,
      next_move: settings.next_move,
    }
  end
end