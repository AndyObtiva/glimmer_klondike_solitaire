class GlimmerKlondikeSolitaire
  module View
    class DealingPile
      include Glimmer::UI::CustomWidget
      
      attr_accessor :current_image
      
      before_body {
        @image_empty = image(50, 80) {
          rectangle(0, 0, 50, 80) {
            background :dark_green
            
            rectangle(0, 0, 49, 79, 15, 15) {
              foreground :gray
            }
          }
        }
        @image_filled = image(50, 80) {
          rectangle(0, 0, 50, 80) {
            background :dark_green
            
            rectangle(0, 0, 49, 79, 15, 15) {
              background :red
            }
          }
        }
        self.current_image = @image_filled
      }
  
      body {
        canvas {
          background :transparent
          
          image {
            image <= [self, :current_image]
            x 0
            y 0
          }
          
          on_swt_mouseup do
            self.current_image = self.current_image == @image_filled ? @image_empty : @image_filled
          end
        }
      }
  
    end
  end
end
