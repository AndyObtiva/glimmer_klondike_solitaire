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
        DEALING_INITIAL_COUNT.times { playing_cards << @game.deck.pop }
      end

      def deal!
        playing_card = playing_cards.shift
        @game.dealt_pile.push!(playing_card) unless playing_card.nil?
    end
      
      def playing_cards
        @playing_cards ||= []
      end
    end
  end
end
