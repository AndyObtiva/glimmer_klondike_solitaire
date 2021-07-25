class GlimmerKlondikeSolitaire
  module View
    class EmptyPlayingCard
      include Glimmer::UI::CustomShape
  
      body {
        rectangle(0, 0, 50, 80) {
          background :dark_green
          
          rectangle(0, 0, 49, 79, 15, 15) {
            foreground :gray
          }
        }
      }
  
    end
  end
end
