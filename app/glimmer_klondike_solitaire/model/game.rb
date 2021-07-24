require_relative 'playing_card'
require_relative 'dealt_pile'
require_relative 'dealing_pile'

class GlimmerKlondikeSolitaire
  module Model
    class Game
      DEALING_INITIAL_COUNT = 24
      
      class << self
        def restart!
          PlayingCard.refresh_deck!
          DealingPile.playing_cards.clear
          24.times.map { DealingPile.playing_cards << PlayingCard.deck.pop }
          DealtPile.playing_cards.clear
        end
      end
    end
  end
end
