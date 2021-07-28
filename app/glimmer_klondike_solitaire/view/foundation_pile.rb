require 'glimmer_klondike_solitaire/model/playing_card'
require 'glimmer_klondike_solitaire/model/foundation_pile'

class GlimmerKlondikeSolitaire
  module View
    class FoundationPile
      include Glimmer::UI::CustomShape
      
      options :pile_x, :pile_y, :game, :suit
      
      attr_accessor :current_image, :model
      
      before_body {
        self.current_image = image(50, 80) {empty_playing_card(suit: suit)}
        self.model = game.foundation_piles[Model::PlayingCard::SUITS.index(suit)]
      }
  
      after_body {
        observe(model, 'playing_cards.last') do |last_card|
          if last_card
            body_root.content {
              playing_card(model: last_card)
            }
          end
        end
      }
      
      body {
        shape(pile_x, pile_y) {
          background :transparent
          
          empty_playing_card(suit: suit)
          
          on_drop do |drop_event|
            begin
              card_shape = drop_event.dragged_shape.get_data('custom_shape')
              card = card_shape.model
              model.add!(card)
              card_parent_shape = card_shape.parent.get_data('custom_shape')
              card_source_model = card_shape.parent.get_data('custom_shape').model
              card_source_model.remove!(card)
              drop_event.dragged_shape.dispose
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
