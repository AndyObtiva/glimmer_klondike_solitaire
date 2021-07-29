class GlimmerKlondikeSolitaire
  module View
    class HiddenPlayingCard
      include Glimmer::UI::CustomShape
      
      IMAGE_FILE = File.join(APP_ROOT, 'images', 'resized', 'BACK.png')
  
      body {
        image {
          image IMAGE_FILE
          x 0
          y 0
        }
      }
  
    end
  end
end
