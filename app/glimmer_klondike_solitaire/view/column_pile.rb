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
      
      options :pile_x, :pile_y, :model
      
      after_body {
        observe(model, 'playing_cards.to_a') do |new_playing_cards|
          build_column_pile(new_playing_cards)
        end
        build_column_pile(model.playing_cards)
      }
      
      body {
        shape(pile_x, pile_y) {
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
  
      def build_column_pile(playing_cards)
        body_root.shapes.to_a.each(&:dispose)
        # TODO nest cards within each other so they'd carry each other in drag & drop
        playing_cards.each_with_index do |card, i|
          body_root.content {
            playing_card(card_x: 0, card_y: i*20, model: card) {
              drag_source true unless card.hidden?
            }
          }
        end
      end
    end
  end
end
