require_relative 'playing_card'
require_relative 'dealt_pile'

class GlimmerKlondikeSolitaire
  module Model
    class DealingPile
      class << self
        def deal!
          DealtPile.push!(playing_cards.shift)
        end
        
        def playing_cards
          @playing_cards ||= []
        end
      end
    end
  end
end
