require 'glimmer_klondike_solitaire/model/playing_card'
require 'glimmer_klondike_solitaire/model/foundation_pile'

class GlimmerKlondikeSolitaire
  module View
    class FoundationPile
      include Glimmer::UI::CustomWidget
      
      IMAGE_EMPTY = image(50, 80) {
        rectangle(0, 0, 50, 80) {
          background :dark_green
          
          rectangle(0, 0, 49, 79, 15, 15) {
            foreground :gray
          }
        }
      }
      
      options :game, :suit
      
      attr_accessor :current_image
      
      before_body {
        self.current_image = IMAGE_EMPTY
      }
  
      body {
        canvas {
          background :transparent
          
          image {
            image <= [game.foundation_piles[Model::PlayingCard::SUITS.index(suit)], 'playing_cards.empty?', on_read: ->(v) {v ? IMAGE_EMPTY : playing_card_image}]
            x 0
            y 0
          }
        }
      }
      
      def playing_card_image
        playing_card = game.foundation_piles[Model::PlayingCard::SUITS.index(suit)].playing_cards.last
        
        image(50, 80) {
          rectangle(0, 0, 50, 80) {
            background :dark_green
            
            rectangle(0, 0, 49, 79, 15, 15) {
              background :white
              
              text {
                string <= [game.foundation_piles[Model::PlayingCard::SUITS.index(suit)], 'playing_cards.last', on_read: ->(card) {"#{card.rank} #{card.suit.to_s[0].upcase}" if card}]
                x 0
                y 0
                foreground <= [game.foundation_piles[Model::PlayingCard::SUITS.index(suit)], 'playing_cards.last', on_read: ->(card) {card.color if card}]
              }
            }
          }
        }
      end
  
    end
  end
end
