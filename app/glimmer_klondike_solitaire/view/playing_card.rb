class GlimmerKlondikeSolitaire
  module View
    class PlayingCard
      include Glimmer::UI::CustomShape
  
      options :card_x, :card_y, :model
      
      before_body {
        self.card_x ||= 0
        self.card_y ||= 0
      }
  
      body {
        rectangle(card_x, card_y, 49, 79, 15, 15) {
          background :white
          
          # border
          rectangle(0, 0, 49, 79, 15, 15) {
            foreground :black
          }
          
          text {
            string model ? "#{model.rank} #{model.suit.to_s[0].upcase}" : ""
            x 5
            y 5
            foreground model ? model.color : :transparent
          }
        }
      }
  
    end
  end
end
