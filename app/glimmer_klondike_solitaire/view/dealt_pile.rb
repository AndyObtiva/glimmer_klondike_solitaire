require 'glimmer_klondike_solitaire/model/dealt_pile'

require_relative 'empty_playing_card'

class GlimmerKlondikeSolitaire
  module View
    class DealtPile
      include Glimmer::UI::CustomShape
      
      options :pile_x, :pile_y, :game
      
      after_body do
        observe(game.dealt_pile, 'playing_cards.empty?') do |empty_value|
          body_root.shapes.to_a.each(&:dispose)
          if empty_value
            body_root.content {
              empty_playing_card
            }
          else
            body_root.content {
              top_playing_card
            }
          end
        end
      end
  
      body {
        shape(pile_x, pile_y) {
          background :transparent
          
          empty_playing_card
        }
      }
                                
      def top_playing_card
        playing_card = game.dealt_pile.playing_cards.last
        
        rectangle(0, 0, 50, 80) {
          background :dark_green
          
          rectangle(0, 0, 49, 79, 15, 15) {
            background :white
            
            text {
              string <= [game.dealt_pile, 'playing_cards.last', on_read: ->(card) {"#{card.rank} #{card.suit.to_s[0].upcase}" if card}]
              x 5
              y 5
              foreground <= [game.dealt_pile, 'playing_cards.last', on_read: ->(card) {card.color if card}]
            }
          }
        }
      end
  
    end
  end
end
