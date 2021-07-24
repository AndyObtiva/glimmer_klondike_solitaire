require_relative 'playing_card'
require_relative 'dealt_pile'
require_relative 'dealing_pile'

class GlimmerKlondikeSolitaire
  module Model
    class Game
      attr_reader :deck, :dealing_pile, :dealt_pile
      
      def initialize
        @deck = new_deck
        @dealt_pile = DealtPile.new(self)
        @dealing_pile = DealingPile.new(self)
      end
                  
      def restart!
        @deck = new_deck
        @dealt_pile.reset!
        @dealing_pile.reset!
      end
        
      private
      
      def new_deck
        PlayingCard.deck.shuffle
      end
    end
  end
end
