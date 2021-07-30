class GlimmerKlondikeSolitaire
  module View
    class HiddenPlayingCard
      include Glimmer::UI::CustomShape
  
      body {
        image {
          image IMAGE_BACK
          x 0
          y 0
        }
      }
  
    end
  end
end
