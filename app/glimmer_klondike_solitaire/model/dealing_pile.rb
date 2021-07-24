require_relative 'playing_card'
require_relative 'dealt_pile'

class GlimmerKlondikeSolitaire
  module Model
    class DealingPile
      DEALING_INITIAL_COUNT = 24
      
      def initialize(game)
        @game = game
        reset!
      end
      
      def reset!
        playing_cards.clear
        DEALING_INITIAL_COUNT.times.map { playing_cards << @game.deck.pop }
      end

      def deal!
        @game.dealt_pile.push!(playing_cards.shift)
      end
      
      def playing_cards
        @playing_cards ||= []
      end
    end
  end
end
