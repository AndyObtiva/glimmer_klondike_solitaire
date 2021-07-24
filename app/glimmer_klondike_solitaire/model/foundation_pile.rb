class GlimmerKlondikeSolitaire
  module Model
    class FoundationPile
      attr_reader :suit
    
      def initialize(game, suit)
        @game = game
        @suit = suit
        reset!
      end
      
      def reset!
        playing_cards.clear
      end
    
      def push!(playing_card)
        playing_cards.push(playing_card) if playing_card.suit == suit && playing_card == (playing_cards.last.rank + 1)
      end
      
      def playing_cards
        @playing_cards ||= []
      end
    end
  end
end
