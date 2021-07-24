require_relative 'playing_card'
require_relative 'discarding_pile'

class GlimmerKlondikeSolitaire
  module Model
    class DealingPile
      class << self
        def deal!
          DiscardingPile.discard!(playing_cards.shift)
        end
        
        def playing_cards
          @playing_cards ||= []
        end
      end
    end
  end
end
