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
              string suit.to_s.capitalize
              x :default
              y :default
              is_transparent true
              foreground [:spades, :clubs].include?(suit) ? :black : rgb(206, 35, 21)
              font height: 16, style: :bold
            }
          end
        }
      }
  
    end
  end
end
