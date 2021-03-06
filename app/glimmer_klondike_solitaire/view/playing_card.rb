class GlimmerKlondikeSolitaire
  module View
    class PlayingCard
      include Glimmer::UI::CustomShape
  
      options :card_x, :card_y, :model, :parent_pile
      
      before_body {
        self.card_x ||= 0
        self.card_y ||= 0
      }
  
      body {
        image {
          image model.hidden ? IMAGE_BACK : IMAGES[model.suit][model.rank]
          x card_x
          y card_y
        }
      }
  
    end
  end
end
