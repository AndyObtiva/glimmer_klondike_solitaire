require 'glimmer_klondike_solitaire/model/dealt_pile'

class GlimmerKlondikeSolitaire
  module View
    class DealtPile
      include Glimmer::UI::CustomShape
      
      IMAGE_EMPTY = image(50, 80) {
        rectangle(0, 0, 50, 80) {
          background :dark_green
          
          rectangle(0, 0, 49, 79, 15, 15) {
            foreground :gray
          }
        }
      }
            
      options :pile_x, :pile_y, :game
      
      attr_accessor :current_image
      
      before_body {
        self.current_image = IMAGE_EMPTY
      }
  
      body {
        shape(pile_x, pile_y) {
          background :transparent
          
          image {
            image <= [game.dealt_pile, 'playing_cards.empty?', on_read: ->(v) {v ? IMAGE_EMPTY : playing_card_image}]
            x 0
            y 0
          }
          
          # add drag event
        }
      }
      
      def playing_card_image
        playing_card = game.dealt_pile.playing_cards.last
        
        image(50, 80) {
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
        }
      end
  
    end
  end
end
