require 'glimmer_klondike_solitaire/model/column_pile'

class GlimmerKlondikeSolitaire
  module View
    class ColumnPile
      include Glimmer::UI::CustomWidget
  
      IMAGE_EMPTY = image(50, 80) {
        rectangle(0, 0, 50, 80) {
          background :dark_green
          
          rectangle(0, 0, 49, 79, 15, 15) {
            foreground :gray
          }
        }
      }
      
      options :game, :count
      
      attr_accessor :current_image
      
      before_body {
        self.current_image = IMAGE_EMPTY
      }
      
      after_body {
        observe(game, "column_piles[#{count - 1}]") do |new_column_pile|
          build_column_pile(new_column_pile)
        end
        build_column_pile(game.column_piles[count - 1])
      }
      
      body {
        canvas {
          background :transparent
        }
      }
  
      def build_column_pile(pile)
        body_root.shapes.to_a.each(&:dispose)
        pile.playing_cards.each_with_index do |playing_card, i|
          body_root.content {
            rectangle(0, i*5, 50, 80) {
              background :dark_green
              
              rectangle(0, 0, 49, 79, 15, 15) {
                background :white
                
                text {
                  string <= [pile, 'playing_cards.last', on_read: ->(card) {card ? "#{card.rank} #{card.suit.to_s[0].upcase}" : ''}]
                  x :default
                  y :default
                  foreground <= [pile, 'playing_cards.last', on_read: ->(card) {card.color if card}]
                }
              }
            }
          }
        end
      end
    end
  end
end
