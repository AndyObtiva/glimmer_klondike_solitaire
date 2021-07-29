class GlimmerKlondikeSolitaire
  module View
    class EmptyPlayingCard
      include Glimmer::UI::CustomShape
      
      option :suit
  
      body {
        rectangle(0, 0, PLAYING_CARD_WIDTH - 2, PLAYING_CARD_HEIGHT - 2, 15, 15) {
          foreground :gray
          
          if suit
            text {
              string suit.to_s.capitalize
              x :default
              y :default
              is_transparent true
              foreground [:spades, :clubs].include?(suit) ? :black : :red
            }
          end
        }
      }
  
    end
  end
end
