require 'glimmer_klondike_solitaire/model/discarding_pile'

class GlimmerKlondikeSolitaire
  module View
    class DiscardingPile
      include Glimmer::UI::CustomWidget
      
      IMAGE_EMPTY = image(50, 80) {
        rectangle(0, 0, 50, 80) {
          background :dark_green
          
          rectangle(0, 0, 49, 79, 15, 15) {
            foreground :gray
          }
        }
      }
      IMAGE_FILLED = image(50, 80) {
        rectangle(0, 0, 50, 80) {
          background :dark_green
          
          rectangle(0, 0, 49, 79, 15, 15) {
            background :red
          }
        }
      }
      
      attr_accessor :current_image
      
      before_body {
        self.current_image = IMAGE_FILLED
      }
  
      body {
        canvas {
          background :transparent
          
          image {
            image <= [Model::DiscardingPile, 'playing_cards.empty?', on_read: ->(v) {v ? IMAGE_EMPTY : IMAGE_FILLED}]
            x 0
            y 0
          }
          
          # add drag event
        }
      }
  
    end
  end
end
