require 'glimmer_klondike_solitaire/model/dealt_pile'

require_relative 'empty_playing_card'
require_relative 'playing_card'

class GlimmerKlondikeSolitaire
  module View
    class DealtPile
      include Glimmer::UI::CustomShape
      
      options :pile_x, :pile_y, :game
      
      after_body do
        observe(game.dealt_pile, 'playing_cards.empty?') do |empty_value|
          if empty_value
            body_root.shapes.to_a.dup.each(&:dispose)
            body_root.content {
              empty_playing_card
            }
          else
            body_root.content {
              playing_card(model: game.dealt_pile.playing_cards.last) {
                drag_source true
              }
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
                                
    end
  end
end
