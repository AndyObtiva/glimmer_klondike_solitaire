require_relative 'playing_card'

class GlimmerKlondikeSolitaire
  module Model
    class DiscardingPile
      class << self
        def discard!(playing_card)
          playing_cards.push(playing_card)
        end
        
        # TODO def grab!
        
        def playing_cards
          @playing_cards ||= []
        end
      end
    end
  end
end
