class GlimmerKlondikeSolitaire
  module View
    class EmptyPlayingCard
      include Glimmer::UI::CustomShape
      
      options :card_x, :card_y, :suit
  
      before_body {
        self.card_x ||= 0
        self.card_y ||= 0
      }
      
      body {
        rectangle(card_x, card_y, PLAYING_CARD_WIDTH - 2, PLAYING_CARD_HEIGHT - 2, 15, 15) {
          foreground :gray
          
          if suit
            text {
              string suit_text(suit)
              x :default
              y :default
              is_transparent true
              foreground [:spades, :clubs].include?(suit) ? :black : rgb(206, 35, 21)
              font height: 35
            }
          end
        }
      }
      
      def suit_text(suit)
        case suit
        when :spades
          "♤"
        when :hearts
          "♡"
        when :clubs
          "♧"
        when :diamonds
          "♢"
        end
      end
  
    end
  end
end
