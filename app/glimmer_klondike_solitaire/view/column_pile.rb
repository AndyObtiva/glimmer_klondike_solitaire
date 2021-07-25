require 'glimmer_klondike_solitaire/model/column_pile'

require_relative 'playing_card'

class GlimmerKlondikeSolitaire
  module View
    class ColumnPile
      include Glimmer::UI::CustomShape
  
      IMAGE_EMPTY = image(50, 80) {
        rectangle(0, 0, 50, 80) {
          background :dark_green
          
          rectangle(0, 0, 49, 79, 15, 15) {
            foreground :gray
          }
        }
      }
      
      options :pile_x, :pile_y, :game, :count
      
      attr_accessor :current_image
      
      before_body {
        self.current_image = IMAGE_EMPTY
      }
      
      after_body {
        observe(game.column_piles[count - 1], :playing_cards) do |new_playing_cards|
          build_column_pile(new_playing_cards)
        end
        build_column_pile(game.column_piles[count - 1].playing_cards)
      }
      
      body {
        shape(pile_x, pile_y) {
          background :transparent
        }
      }
  
      def build_column_pile(playing_cards)
        body_root.shapes.to_a.each(&:dispose)
        playing_cards.each_with_index do |card, i|
          body_root.content {
            playing_card(card_x: 0, card_y: i*20, model: card)
          }
        end
      end
    end
  end
end
