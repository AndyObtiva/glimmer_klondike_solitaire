class GlimmerKlondikeSolitaire
  module View
    class PlayingCard
      include Glimmer::UI::CustomShape
  
      options :card_x, :card_y, :model, :parent_pile
      
      before_body {
        self.card_x ||= 0
        self.card_y ||= 0
        
        @image_file = File.join(APP_ROOT, 'images', 'resized', model.hidden ? "BACK.png" : "#{model.rank}#{model.suit.to_s[0].upcase}.png")
      }
  
      body {
        image {
          image @image_file
          x card_x
          y card_y
        }
      }
  
    end
  end
end
