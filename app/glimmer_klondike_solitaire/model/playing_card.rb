class GlimmerKlondikeSolitaire
  module Model
    class PlayingCard
      SUITS = [:spades, :hearts, :clubs, :diamonds]
      RANK_COUNT = 13
      
      class << self
        # refresh deck to start a new game
        def refresh_deck!
          @deck = nil
          @deck = deck
        end
      
        # a shuffled deck
        # this deck is meant to be depleted when setting up a new game
        def deck
          @deck ||= suit_decks.flatten.shuffle
        end
        
        def suit_decks
          SUITS.map do |suit|
            suit_deck(suit)
          end
        end
        
        def suit_deck(suit)
          1.upto(RANK_COUNT).map do |rank|
            new(rank, suit)
          end
        end
      end
      
      attr_reader :rank, :suit
      
      def initialize(rank, suit)
        @rank = rank
        @suit = suit
      end
    end
  end
end
