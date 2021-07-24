require_relative 'playing_card'

class GlimmerKlondikeSolitaire
  module Model
    class DealtPile
      class << self
        def push!(playing_card)
          playing_cards.push(playing_card)
        end
        
        def pop!
          playing_cards.pop
        end
        
        def playing_cards
          @playing_cards ||= []
        end
      end
    end
  end
end
