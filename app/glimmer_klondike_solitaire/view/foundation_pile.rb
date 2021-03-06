require 'glimmer_klondike_solitaire/model/playing_card'
require 'glimmer_klondike_solitaire/model/foundation_pile'

class GlimmerKlondikeSolitaire
  module View
    class FoundationPile
      include Glimmer::UI::CustomShape
      
      options :pile_x, :pile_y, :game, :suit
      
      attr_accessor :current_image, :model
      
      before_body {
        self.current_image = image(PLAYING_CARD_WIDTH, PLAYING_CARD_HEIGHT) {empty_playing_card(suit: suit)}
        self.model = game.foundation_piles[Model::PlayingCard::SUITS.index(suit)]
      }
  
      after_body {
        observe(model, 'playing_cards.last') do |last_card|
          if last_card
            body_root.content {
              playing_card(model: last_card)
            }
          else
            body_root.shapes.to_a.dup.each {|shape| shape.dispose(dispose_images: false)}
            body_root.content {
              empty_playing_card(suit: suit)
            }
          end
        end
      }
      
      body {
        shape(pile_x, pile_y) {
          empty_playing_card(suit: suit)
          
          on_drop do |drop_event|
            begin
              # TODO make sure one cannot drag a column pile of cards here
              card_shape = drop_event.dragged_shape.get_data('custom_shape')
              card = card_shape.model
              card_parent_pile = card_shape.parent_pile
              card_source_model = card_parent_pile.model
              raise 'Cannot accept multiple cards' if card_source_model.playing_cards.index(card) != (card_source_model.playing_cards.size - 1)
              model.add!(card)
              card_source_model.remove!(card)
              drop_event.dragged_shape.dispose(dispose_images: false)
            rescue => e
#               pd e
              drop_event.doit = false
            end
          end
        }
      }
    end
    
  end
  
end
