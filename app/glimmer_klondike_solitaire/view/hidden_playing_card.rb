class GlimmerKlondikeSolitaire
  module View
    class HiddenPlayingCard
      include Glimmer::UI::CustomShape
  
      options :card_x, :card_y
  
      before_body {
        self.card_x ||= 0
        self.card_y ||= 0
      }
      
      body {
        image {
          image IMAGE_BACK
          x card_x
          y card_y
        }
      }
  
    end
  end
end
