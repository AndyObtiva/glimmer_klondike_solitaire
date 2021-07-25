class GlimmerKlondikeSolitaire
  module View
    class HiddenPlayingCard
      include Glimmer::UI::CustomShape
  
      body {
        rectangle(0, 0, 50, 80) {
          background :dark_green
          
          rectangle(0, 0, 49, 79, 15, 15) {
            background :red
          }
        }
      }
  
    end
  end
end
